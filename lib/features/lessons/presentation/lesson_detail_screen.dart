// ignore_for_file: avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/lessons/data/models/lesson_model.dart';
import 'package:video_player/video_player.dart';

import '../../../common/commons.dart';
import '../../features.dart' show LessonVideoPlayer;
import '../domain/domain.dart';

/// A lesson‑detail screen that plays one or more videos in order and keeps
/// track of progress.
/// Improvements over the previous version:
/// * State is initialised in `useEffect` to avoid side‑effects inside build.
/// * Defensive checks guard against `RangeError` when lists are still empty.
/// * Dependency list for `useEffect` uses `videoUrls?.length` so it only
///   re‑runs when the number of videos changes.
/// * Helper widgets and methods extracted for clarity.
/// * Consistent padding and theming.
@RoutePage()

/// A lesson‑detail screen that plays one or more videos in order using **Chewie**
/// and keeps track of progress.
@RoutePage()
class SecondLessonDetailScreen extends HookConsumerWidget {
  final LevelDetails details;
  const SecondLessonDetailScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ───────────── Local hook‑based state ─────────────
    final currentVideoIndex = useState(0);
    final videoCompleted = useState<List<bool>>([]);
    final videoStarted = useState<List<bool>>([]);

    final lessonAsync = ref.watch(fetchLessonsByIdProvider(details));

    return lessonAsync.when(
      error: (e, _) => Center(child: Text('Error: $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (lesson) {
        final urlsAsync = ref.watch(fetchVideoUrlsForLessonProvider(lesson));
        final videoUrls = urlsAsync.asData?.value;

        // Initialise progress arrays once per change in video count
        useEffect(() {
          final count = videoUrls?.length ?? 0;
          if (count > 0 && videoCompleted.value.length != count) {
            videoCompleted.value = List.filled(count, false);
            videoStarted.value = List.filled(count, false);
            if (currentVideoIndex.value >= count) currentVideoIndex.value = 0;
          }
          return null;
        }, [videoUrls?.length]);

        // Helper safe getter
        bool _get(List<bool> list) =>
            list.isNotEmpty && currentVideoIndex.value < list.length
                ? list[currentVideoIndex.value]
                : false;

        final started = _get(videoStarted.value);
        final completed = _get(videoCompleted.value);

        final index = currentVideoIndex.value;
        final isFirst = index == 0;
        final isLast = videoUrls == null ? true : index == videoUrls.length - 1;
        final allDone = videoCompleted.value.isNotEmpty &&
            videoCompleted.value.every((c) => c);

        final currentUrl = videoUrls == null || index >= videoUrls.length
            ? null
            : videoUrls[index];

        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${lesson.title} • ${details.unitId.toUpperCase()} • Lesson ${lesson.order}',
            ),
          ),
          body: videoUrls == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (videoUrls.length > 1)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Video ${index + 1} of ${videoUrls.length}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      _ChewieVideoCard(
                        url: currentUrl,
                        onStart: () {
                          final list = List<bool>.from(videoStarted.value);
                          list[index] = true;
                          videoStarted.value = list;
                        },
                        onComplete: () {
                          final list = List<bool>.from(videoCompleted.value);
                          list[index] = true;
                          videoCompleted.value = list;
                        },
                      ),
                      const SizedBox(height: 16),
                      _LessonContent(lesson: lesson),
                      const SizedBox(height: 16),
                      if (started) _ProgressIndicator(completed: completed),
                      const SizedBox(height: 16),
                      _NavigationButtons(
                        isFirst: isFirst,
                        isLast: isLast,
                        currentCompleted: completed,
                        allCompleted: allDone,
                        onPrev: () => currentVideoIndex.value--,
                        onNext: () => currentVideoIndex.value++,
                        onFinish: () =>
                            print('All videos completed - navigate'),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

//   ──────────────────────────────────────────────────────────────────────────
// ~ Video player using **Chewie** + `video_player`
//  ──────────────────────────────────────────────────────────────────────────
class _ChewieVideoCard extends HookWidget {
  const _ChewieVideoCard({
    required this.url,
    required this.onStart,
    required this.onComplete,
  });

  final String? url;
  final VoidCallback onStart;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: url == null
            ? const Text('No video available')
            : _ChewiePlayer(
                url: url!, onStart: onStart, onComplete: onComplete),
      ),
    );
  }
}

class _ChewiePlayer extends HookWidget {
  const _ChewiePlayer({
    required this.url,
    required this.onStart,
    required this.onComplete,
  });

  final String url;
  final VoidCallback onStart;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final videoController =
        useMemoized(() => VideoPlayerController.network(url));
    final chewieController = useMemoized(() => ChewieController(
          videoPlayerController: videoController,
          autoPlay: false,
          looping: false,
        ));
    final initialised = useState(false);
    final hasStarted = useState(false);

    useEffect(() {
      videoController.initialize().then((_) => initialised.value = true);

      void listener() {
        if (videoController.value.isPlaying && !hasStarted.value) {
          hasStarted.value = true;
          onStart();
        }
        // Detect completion
        if (videoController.value.position >= videoController.value.duration &&
            !videoController.value.isPlaying) {
          onComplete();
        }
      }

      videoController.addListener(listener);
      return () {
        videoController.removeListener(listener);
        chewieController.dispose();
        videoController.dispose();
      };
    }, []);

    if (!initialised.value) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return AspectRatio(
      aspectRatio: videoController.value.aspectRatio > 0
          ? videoController.value.aspectRatio
          : 16 / 9,
      child: Chewie(controller: chewieController),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────
// ~ Supporting UI widgets (unchanged logic)
// ──────────────────────────────────────────────────────────────────────────
class _LessonContent extends StatelessWidget {
  const _LessonContent({required this.lesson});
  final LessonModel lesson;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lesson Content',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          lesson.description ??
              'This is the lesson content that goes with the video. You can add instructions, explanations, or any other content here.',
        ),
      ],
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({required this.completed});
  final bool completed;

  @override
  Widget build(BuildContext context) {
    final color = completed ? Colors.green : Colors.blue;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(completed ? Icons.check_circle : Icons.play_circle,
                color: color),
            const SizedBox(width: 8),
            Text(completed ? 'Video completed!' : 'Video in progress…',
                style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}

class _NavigationButtons extends StatelessWidget {
  const _NavigationButtons({
    required this.isFirst,
    required this.isLast,
    required this.currentCompleted,
    required this.allCompleted,
    required this.onPrev,
    required this.onNext,
    required this.onFinish,
  });

  final bool isFirst;
  final bool isLast;
  final bool currentCompleted;
  final bool allCompleted;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: isFirst ? null : onPrev,
          child: const Text('Previous'),
        ),
        ElevatedButton(
          onPressed: allCompleted
              ? onFinish
              : currentCompleted && !isLast
                  ? onNext
                  : null,
          child: Text(
            allCompleted
                ? 'Completed'
                : currentCompleted && !isLast
                    ? 'Next Video'
                    : 'Next',
          ),
        ),
      ],
    );
  }
}



/* 

class SecondLessonDetailScreen extends HookConsumerWidget {
  final LevelDetails details;

  const SecondLessonDetailScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ──────────────────────────────────────────────────────────────────────
    // Local state (Hook)
    // ──────────────────────────────────────────────────────────────────────
    final currentVideoIndex = useState(0);
    final videoCompleted = useState<List<bool>>([]);
    final videoStarted = useState<List<bool>>([]);

    // Fetch lesson meta
    final lessonAsync = ref.watch(fetchLessonsByIdProvider(details));

    return lessonAsync.when(
      error: (e, _) => Center(child: Text("Error $e")),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (lesson) {
        // Fetch the Storage URLs for the lesson's videos
        final videoUrlsAsync = ref.watch(fetchVideoUrlsForLessonProvider(lesson));
        final videoUrls = videoUrlsAsync.asData?.value;

        // ───── Initialise per‑video state exactly once per video‑count change ─────
        useEffect(() {
          final count = videoUrls?.length ?? 0;
          if (count > 0 && videoCompleted.value.length != count) {
            videoCompleted.value = List.filled(count, false);
            videoStarted.value = List.filled(count, false);
            // Keep currentVideoIndex in range after refresh
            if (currentVideoIndex.value >= count) currentVideoIndex.value = 0;
          }
          return null;
        }, [videoUrls?.length]);

        // Convenient getters with range safety
        bool _safeBool(List<bool> list) =>
            list.isNotEmpty && currentVideoIndex.value < list.length
                ? list[currentVideoIndex.value]
                : false;

        final isStarted = _safeBool(videoStarted.value);
        final isCompleted = _safeBool(videoCompleted.value);

        final index = currentVideoIndex.value;
        final isFirst = index == 0;
        final isLast = videoUrls == null ? true : index == videoUrls.length - 1;
        final allCompleted =
            videoCompleted.value.isNotEmpty &&
                videoCompleted.value.every((c) => c);

        final currentUrl =
            videoUrls == null || index >= videoUrls.length ? null : videoUrls[index];

        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${lesson.title} • ${details.unitId.toUpperCase()} • Lesson ${lesson.order}',
            ),
          ),
          body: videoUrls == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (videoUrls.length > 1)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Video ${index + 1} of ${videoUrls.length}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Text("${videoUrls.toString()}"),

                      // _VideoPlayerCard(
                      //   // url: currentUrl,
                      //   url: videoUrls.first,
                      //   onStart: () {
                      //     // mark started
                      //     final list = List<bool>.from(videoStarted.value);
                      //     list[index] = true;
                      //     videoStarted.value = list;
                      //   },
                      //   onComplete: () {
                      //     final list = List<bool>.from(videoCompleted.value);
                      //     list[index] = true;
                      //     videoCompleted.value = list;
                      //   },
                      // ),

                      const SizedBox(height: 16),
                      _LessonContent(lesson: lesson),
                      const SizedBox(height: 16),

                      if (isStarted)
                        _ProgressIndicator(completed: isCompleted),

                      const SizedBox(height: 16),

                      _NavigationButtons(
                        isFirst: isFirst,
                        isLast: isLast,
                        currentCompleted: isCompleted,
                        allCompleted: allCompleted,
                        onPrev: () => currentVideoIndex.value--,
                        onNext: () => currentVideoIndex.value++,
                        onFinish: () {
                          // TODO: Navigate to the next lesson or show dialog
                          print('All videos completed – navigate to next lesson');
                        },
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

 */
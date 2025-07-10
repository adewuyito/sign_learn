import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../common/commons.dart';
import '../data/models/lesson_model.dart';
import '../domain/domain.dart';

@RoutePage()
@RoutePage()
class SecondLessonDetailScreen extends HookConsumerWidget {
  final LevelDetails details;
  const SecondLessonDetailScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVideoIndex = useState(0);
    final videoCompleted = useState<List<bool>>([]);
    final videoStarted = useState<List<bool>>([]);
    final controllerMap = useRef<Map<int, VideoPlayerController>>({});
    final lastNavAction =
        useState<String>('initial'); // 'next', 'prev', 'initial'

    final lessonAsync = ref.watch(fetchLessonsByIdProvider(details));

    return lessonAsync.when(
      error: (e, _) => Center(child: Text('Error: $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (lesson) {
        final urlsAsync = ref.watch(fetchVideoUrlsForLessonProvider(lesson));
        final videoUrls = urlsAsync.asData?.value;

        useEffect(() {
          final count = videoUrls?.length ?? 0;
          if (count > 0 && videoCompleted.value.length != count) {
            videoCompleted.value = List.filled(count, false);
            videoStarted.value = List.filled(count, false);
            if (currentVideoIndex.value >= count) currentVideoIndex.value = 0;
          }
          return null;
        }, [videoUrls?.length]);

        // Preload the next video
        useEffect(() {
          final currentIndex = currentVideoIndex.value;
          final urls = videoUrls;
          if (urls == null || urls.length <= currentIndex + 1) return null;

          if (!controllerMap.value.containsKey(currentIndex + 1)) {
            final nextController = VideoPlayerController.networkUrl(
                Uri.parse(urls[currentIndex + 1]));
            nextController.initialize().then((_) {
              controllerMap.value[currentIndex + 1] = nextController;
            });
          }

          return () {
            controllerMap.value.forEach((index, ctrl) {
              if (index != currentIndex && index != currentIndex + 1) {
                ctrl.dispose();
              }
            });
            controllerMap.value.removeWhere((index, _) =>
                index != currentIndex && index != currentIndex + 1);
          };
        }, [currentVideoIndex.value, videoUrls?.length]);

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
                        Text(
                          'Video ${index + 1} of ${videoUrls.length}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: videoCompleted.value.where((c) => c).length /
                            videoUrls.length,
                        backgroundColor: Colors.grey[200],
                        color: Colors.green,
                      ),
                      const SizedBox(height: 16),
                      _SimpleVideoPlayerCard(
                        key: ValueKey(currentUrl),
                        url: currentUrl,
                        preloadedController: controllerMap.value[index],
                        autoPlay: lastNavAction.value == 'next' ||
                            lastNavAction.value == 'initial',
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
                        onPrev: () {
                          lastNavAction.value = 'prev';
                          currentVideoIndex.value--;
                        },
                        onNext: () {
                          lastNavAction.value = 'next';
                          currentVideoIndex.value++;
                        },
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

class _SimpleVideoPlayerCard extends HookConsumerWidget {
  const _SimpleVideoPlayerCard({
    super.key,
    required this.url,
    required this.onStart,
    required this.onComplete,
    this.autoPlay = false,
    this.preloadedController,
  });

  final String? url;
  final bool autoPlay;
  final VideoPlayerController? preloadedController;
  final VoidCallback onStart;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (url == null) return const Text('No video available');

    final controller = useMemoized(
      () =>
          preloadedController ??
          VideoPlayerController.networkUrl(Uri.parse(url!)),
      [url],
    );
    final initialized = useState(false);
    final hasStarted = useState(false);
    final isCompleted = useState(false);

    useEffect(() {
      bool mounted = true;

      Future<void> init() async {
        if (preloadedController == null) {
          await controller.initialize();
        }
        if (mounted) {
          initialized.value = true;
          if (autoPlay) {
            controller.play();
          }
        }
      }

      init();

      void listener() {
        if (controller.value.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('⚠️ Error loading video')),
          );
        }

        if (controller.value.isPlaying && !hasStarted.value) {
          hasStarted.value = true;
          isCompleted.value = false;
          onStart();
        }

        if (controller.value.position >= controller.value.duration &&
            !controller.value.isPlaying &&
            !isCompleted.value) {
          isCompleted.value = true;
          onComplete();
        }
      }

      controller.addListener(listener);

      return () {
        mounted = false;
        controller.removeListener(listener);
        if (preloadedController == null) {
          controller.dispose();
        }
      };
    }, [controller]);

    if (!initialized.value) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: controller.value.aspectRatio > 0
              ? controller.value.aspectRatio
              : 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: VideoPlayer(controller),
          ),
        ),
        if (isCompleted.value)
          Positioned.fill(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.seekTo(Duration.zero);
                  controller.play();
                  isCompleted.value = false;
                  hasStarted.value = false;
                },
                child: const Text('Replay'),
              ),
            ),
          ),
      ],
    );
  }
}

class _LessonContent extends StatelessWidget {
  const _LessonContent({required this.lesson});
  final LessonModel lesson;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Lesson Content',
            style: Theme.of(context).textTheme.headlineSmall),
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
            Text(
              completed ? 'Video completed!' : 'Video in progress…',
              style: TextStyle(color: color),
            ),
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
                ? 'Take Quiz'
                : currentCompleted && !isLast
                    ? 'Next Video'
                    : 'Next',
          ),
        ),
      ],
    );
  }
}





// ~ Previous Before GPT Optimization
/* 

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../common/commons.dart';
import '../data/models/lesson_model.dart';
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
                      _SimpleVideoPlayerCard(
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
class _SimpleVideoPlayerCard extends HookWidget {
  const _SimpleVideoPlayerCard({
    required this.url,
    required this.onStart,
    required this.onComplete,
  });

  final String? url;
  final VoidCallback onStart;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: url == null
          ? const Text('No video available')
          : _SimpleVideoPlayer(
              url: url!,
              onStart: onStart,
              onComplete: onComplete,
            ),
    );
  }
}

class _SimpleVideoPlayer extends HookWidget {
  const _SimpleVideoPlayer({
    required this.url,
    required this.onStart,
    required this.onComplete,
  });

  final String url;
  final VoidCallback onStart;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(url);
    final videoController =
        useMemoized(() => VideoPlayerController.networkUrl(uri), [url]);
    final initialized = useState(false);
    final hasStarted = useState(false);
    final isCompleted = useState(false);

    useEffect(() {
      var isMounted = true;
      videoController.initialize().then((_) {
        if (isMounted) {
          initialized.value = true;
          videoController.play(); // Autoplay on load
        }
      });

      void listener() {
        if (videoController.value.isPlaying && !hasStarted.value) {
          hasStarted.value = true;
          isCompleted.value = false;
          onStart();
        }
        if (videoController.value.position >= videoController.value.duration &&
            !videoController.value.isPlaying &&
            !isCompleted.value) {
          isCompleted.value = true;
          onComplete();
        }
      }

      videoController.addListener(listener);

      return () {
        isMounted = false;
        videoController.removeListener(listener);
        videoController.dispose();
      };
    }, [videoController]);

    if (!initialized.value) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: videoController.value.aspectRatio > 0
              ? videoController.value.aspectRatio
              : 16 / 9,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: VideoPlayer(videoController),
          ),
        ),
        if (isCompleted.value)
          Positioned.fill(
            child: Center(
              child: SignUpButton(
                onPressed: () {
                  videoController.seekTo(Duration.zero);
                  videoController.play();
                  isCompleted.value = false;
                  hasStarted.value = false;
                },
                label: 'Replay',
              ),
            ),
          ),
      ],
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
        SignActionButton(
          onPressed: isFirst ? null : onPrev,
          labelWidget: const Text('Previous'),
        ),
        SignActionButton(
          onPressed: allCompleted
              ? onFinish
              : currentCompleted && !isLast
                  ? onNext
                  : null,
          labelWidget: Text(
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

 */ */
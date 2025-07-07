import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
/// Public constructor: pass lessonId + ordered clip URLs.
class LessonPage extends ConsumerStatefulWidget {
  const LessonPage({
    super.key,
    required this.lessonId,
    required this.clipUrls,
  });

  final String lessonId;
  final List<String> clipUrls;

  @override
  ConsumerState<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends ConsumerState<LessonPage> {
  late final PageController _pageController;
  final List<VideoPlayerController> _videoCtrls = [];
  final List<ChewieController> _chewieCtrls = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Pre‑init video controllers
    for (final url in widget.clipUrls) {
      final vp = VideoPlayerController.networkUrl(Uri.parse(url));
      _videoCtrls.add(vp);
      _chewieCtrls.add(
        ChewieController(
          videoPlayerController: vp,
          autoInitialize: true,
          autoPlay: false,
          showControlsOnInitialize: false,
          allowFullScreen: true,
          allowMuting: true,
        ),
      );
    }

    // When a clip ends → move to next
    for (int i = 0; i < _videoCtrls.length; i++) {
      _videoCtrls[i].addListener(() {
        if (_videoCtrls[i].value.position >=
                _videoCtrls[i].value.duration &&
            mounted) {
          _onClipFinished(i);
        }
      });
    }
  }

  void _onClipFinished(int clipIndex) {
    if (clipIndex == widget.clipUrls.length - 1) {
      // Finished whole lesson
      _showCompletionDialog();
      // Persist completion in your use‑case layer:
      // ref.read(lessonProgressProvider.notifier)
      //     .markLessonCompleted(widget.lessonId);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('Lesson Complete!'),
        content: const Text('Great job 🎉'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).popUntil(
              (route) => route.isFirst,
            ),
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  double get _progress =>
      (_currentIndex + 1) / widget.clipUrls.length; // 0 → 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lesson')),
      body: Column(
        children: [
          // --- Progress bar ------------------------------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: LinearProgressIndicator(
              value: _progress,
              minHeight: 6,
              backgroundColor: Colors.grey.shade300,
              valueColor:
                  AlwaysStoppedAnimation(Theme.of(context).colorScheme.primary),
            ),
          ),
          // --- Clip carousel ----------------------------------------------
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(), // disable swipe
              itemCount: widget.clipUrls.length,
              onPageChanged: (i) => setState(() => _currentIndex = i),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Chewie(controller: _chewieCtrls[index]),
                  ),
                );
              },
            ),
          ),
          // --- Manual next button (in case user pauses) -------------------
          if (_currentIndex < widget.clipUrls.length - 1)
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ElevatedButton.icon(
                onPressed: () => _onClipFinished(_currentIndex),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Next clip'),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (final c in _chewieCtrls) c.dispose();
    for (final v in _videoCtrls) v.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/components/sign_button/sign_button.dart';
import 'package:sign_learn/core/constants/constants.dart';
import 'package:sign_learn/features/lessons/data/models/lesson_model.dart';
import 'package:sign_learn/features/lessons/data/repositories/lesson_repository.dart';
import 'package:sign_learn/gen/fonts.gen.dart';
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
    required this.lesson,
  });

  final String lessonId;
  final List<String> clipUrls;
  final LessonModel lesson;

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
        if (_videoCtrls[i].value.position >= _videoCtrls[i].value.duration &&
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

  double get _progress => (_currentIndex + 1) / widget.clipUrls.length; // 0 → 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.lesson.title,
          style: TextTheme.of(context).labelMedium!.copyWith(
                fontFamily: FontFamily.satoshi,
              ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            // size: Size.fromWidth(buttonSize(ButtonSize.full).width),
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
          Card(
            color: appColors.buttonYellow,
            elevation: 0,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Text(
                'Understand how to sign about different places',
                style: TextTheme.of(context).labelMedium!.copyWith(
                      fontFamily: FontFamily.generalSans,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          // --- Manual next button (in case user pauses) -------------------
          if (_currentIndex < widget.clipUrls.length - 1)
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SignActionButton(
                size: buttonSize(ButtonSize.half),
                onPressed: () => _onClipFinished(_currentIndex),
                labelWidget: Row(
                    children: [Text('Next clip'), Icon(Icons.arrow_forward)]),
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

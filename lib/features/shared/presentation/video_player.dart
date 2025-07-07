import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

// Your existing VideoPlayerWidget with improvements
class VideoPlayerWidgetAdvanced extends HookWidget {
  final String videoUrl;
  final bool autoPlay;
  final bool looping;
  final VoidCallback? onVideoEnd;
  final VoidCallback? onVideoStart;

  const VideoPlayerWidgetAdvanced({
    super.key,
    required this.videoUrl,
    this.autoPlay = true,
    this.looping = false,
    this.onVideoEnd,
    this.onVideoStart,
  });

  @override
  Widget build(BuildContext context) {
    final videoUri = Uri.parse(videoUrl);
    final controller = VideoPlayerController.networkUrl(videoUri);
    final isVideoPlayerReady = useState(false);
    final hasError = useState(false);
    final errorMessage = useState<String?>(null);

    useEffect(() {
      controller.initialize().then(
        (_) {
          isVideoPlayerReady.value = true;
          controller.setLooping(looping);
          if (autoPlay) {
            controller.play();
            onVideoStart?.call();
          }
        },
      ).catchError((error) {
        hasError.value = true;
        errorMessage.value = error.toString();
      });

      // Listen for video end
      void listener() {
        if (controller.value.position >= controller.value.duration) {
          onVideoEnd?.call();
        }
      }

      controller.addListener(listener);

      return () {
        controller.removeListener(listener);
        controller.dispose();
      };
    }, [controller]);

    if (hasError.value) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 48, color: Colors.red),
              SizedBox(height: 8),
              Text('Error loading video'),
              Text(errorMessage.value ?? 'Unknown error'),
            ],
          ),
        ),
      );
    }

    switch (isVideoPlayerReady.value) {
      case true:
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(controller),
        );
      case false:
        return SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );
    }
  }
}


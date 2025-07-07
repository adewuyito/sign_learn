// Advanced Video Player with Controls
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

class AdvancedVideoPlayerWidget extends HookWidget {
  final String videoUrl;
  final VoidCallback? onVideoEnd;
  final VoidCallback? onVideoStart;

  const AdvancedVideoPlayerWidget({
    super.key,
    required this.videoUrl,
    this.onVideoEnd,
    this.onVideoStart,
  });

  @override
  Widget build(BuildContext context) {
    final videoUri = Uri.parse(videoUrl);
    final controller = VideoPlayerController.networkUrl(videoUri);
    final isVideoPlayerReady = useState(false);
    final isPlaying = useState(false);
    final showControls = useState(true);

    useEffect(() {
      controller.initialize().then((_) {
        isVideoPlayerReady.value = true;
        controller.play();
        isPlaying.value = true;
        onVideoStart?.call();
      });

      void listener() {
        if (controller.value.position >= controller.value.duration) {
          onVideoEnd?.call();
        }
        isPlaying.value = controller.value.isPlaying;
      }

      controller.addListener(listener);

      return () {
        controller.removeListener(listener);
        controller.dispose();
      };
    }, [controller]);

    if (!isVideoPlayerReady.value) {
      return Container(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return GestureDetector(
      onTap: () {
        showControls.value = !showControls.value;
      },
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoPlayer(controller),
          ),
          if (showControls.value)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isPlaying.value ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (isPlaying.value) {
                          controller.pause();
                        } else {
                          controller.play();
                        }
                      },
                    ),
                    Expanded(
                      child: VideoProgressIndicator(
                        controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: Colors.red,
                          bufferedColor: Colors.grey,
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

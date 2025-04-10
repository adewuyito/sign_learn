import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends HookWidget {
  final String videoUrl;
  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final controller = VideoPlayerController.networkUrl(videoUrl as Uri);

    final isVideoPlayerReady = useState(false);

    useEffect(() {
      controller.initialize().then(
        (value) {
          isVideoPlayerReady.value = true;
          controller.setLooping(true);
          controller.play();
        },
      );
      return controller.dispose;
    }, [controller]);

    switch (isVideoPlayerReady.value) {
      case true:
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(
            controller,
          ),
        );
      case false:
        return CircularProgressIndicator();
    }
  }
}

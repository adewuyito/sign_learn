import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../../common/commons.dart';
import '../../../core/core.dart';
import 'video_player.dart';

class VideoWidget extends ConsumerStatefulWidget {
  const VideoWidget({super.key, required this.lessonVideo});

  final String lessonVideo;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LessonVideoWidgetState();
}

class _LessonVideoWidgetState extends ConsumerState<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return BoxOutline(
      size: Size(screenWidth, 224),
      child: Container(
        decoration: BoxDecoration(
          color: appColors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox.fromSize(
          // ~ Place the video widget here
          size: Size(screenWidth, 224),
          child: VideoPlayerWidgetAdvanced(
            looping: true,
            videoUrl: widget.lessonVideo,
          ),
        ),
      ),
    );
  }
}

//~ Lesson Video Player Widget - Manages Firebase + Video Player
class LessonVideoPlayer extends HookWidget {
  final String? lessonVideoUrl;
  final VoidCallback? onVideoComplete;
  final VoidCallback? onVideoStart;

  const LessonVideoPlayer({
    super.key,
    required this.lessonVideoUrl,
    this.onVideoComplete,
    this.onVideoStart,
  });

  @override
  Widget build(BuildContext context) {
    final videoUrl = useState<String?>(null);
    final isLoading = useState(true);
    final errorMessage = useState<String?>(null);

    Future<void> loadVideo() async {
      try {
        isLoading.value = true;
        errorMessage.value = null;

        String? url = lessonVideoUrl;

        if (url != null) {
          videoUrl.value = url;
        } else {
          errorMessage.value = 'Video not found';
        }
      } catch (e) {
        errorMessage.value = 'Error loading video: $e';
      } finally {
        isLoading.value = false;
      }
    }

    useEffect(() {
      loadVideo();
      return null;
    }, []);

    if (isLoading.value) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading video...'),
            ],
          ),
        ),
      );
    }

    if (errorMessage.value != null) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 48, color: Colors.red),
              SizedBox(height: 8),
              Text('Error loading video'),
              Text(errorMessage.value!),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: loadVideo,
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (videoUrl.value != null) {
      // ~ VideoPlayerWidgetAdvanced Usage
      return VideoPlayerWidgetAdvanced(
        videoUrl: videoUrl.value!,
        onVideoEnd: onVideoComplete,
        onVideoStart: onVideoStart,
      );
    }

    return SizedBox(
      height: 200,
      child: Center(child: Text('No video available')),
    );
  }
}

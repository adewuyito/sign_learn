import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/components/components.dart';
import 'package:sign_learn/core/core.dart';
import 'package:sign_learn/features/dictionary/presentation/providers/dictionary_providers.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class DictionaryEntryDetailView extends ConsumerStatefulWidget {
  final String videoId;
  final String youtubeUrl;

  const DictionaryEntryDetailView(this.videoId, {super.key, required this.youtubeUrl});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DictionaryEntryDetailViewState();
}

class _DictionaryEntryDetailViewState
    extends ConsumerState<DictionaryEntryDetailView> {
  late final YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.youtubeUrl,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final asyncDL = ref.watch(dictionaryEntryByIdProvider(widget.videoId));

    final screenWidth = buttonSize(ButtonSize.full).width;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        minimum: safeAreaPadding,
        child: asyncDL.when(
          data: (lesson) {
            // final videoId = YoutubePlayer.convertUrlToId(lesson!.url);
            // if (videoId != null) {
            //   _youtubePlayerController.load(videoId);
            // } else {
            //   return Center(child: CircularProgressIndicator());
            // }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BoxOutline(
                  size: Size(screenWidth, 224),
                  child: Container(
                    decoration: BoxDecoration(
                      color: appColors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: YoutubePlayer(
                      controller: _youtubePlayerController,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                ),

                // Video Player

                SizedBox(
                  height: 20,
                ), // TODO: Add the description of the sign to the dictionary section. Alson think about related words to link with

                // Transcript
                // Quiz/Questions
                // LessonQuizWidget(lessonId: lesson.id),
                Spacer(),
                // Complete Button
              ],
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, stack) => Center(child: Text('Error loading lesson')),
        ),
      ),
    );
  }
}

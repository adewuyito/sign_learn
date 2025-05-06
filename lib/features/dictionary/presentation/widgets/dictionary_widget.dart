import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../providers/dictionary_providers.dart';

// ~ WIDGET IS NEVER USED
@RoutePage()
class DictionaryEntryPage extends ConsumerWidget {
  const DictionaryEntryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync = ref.watch(dictionaryEntriesProvider);

    return Scaffold(
      appBar: AppBar(title: Text('ASL Dictionary')),
      body: entriesAsync.when(
        data: (entries) => ListView.builder(
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final entry = entries[index];
            final videoId = YoutubePlayer.convertUrlToId(entry.url);

            return Card(
              margin: EdgeInsets.all(8),
              child: ExpansionTile(
                leading: Image.network(
                  entry.thumbnails.high,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text(entry.title),
                children: [
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: videoId ?? entry.videoId,
                      flags: YoutubePlayerFlags(autoPlay: false),
                    ),
                    showVideoProgressIndicator: true,
                  )
                ],
              ),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: \$err')),
      ),
    );
  }
}

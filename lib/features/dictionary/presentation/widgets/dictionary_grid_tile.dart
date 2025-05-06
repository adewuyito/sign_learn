import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../routes/router.dart';
import '../../data/models/dictionary_models.dart';

class DictionaryGridTile extends StatelessWidget {
  const DictionaryGridTile({
    super.key,
    required this.entries,
  });

  final DictionaryEntries entries;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => SignNavigator.of(context)
          .push(DictionaryEntryDetailRoute(videoId: entries.id)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: appColors.black, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: entries.thumbnails.medium,
                  fit: BoxFit.cover,
                ),
              ),
              Text(entries.title)
              // TODO: Fix the widget to look alright
            ],
          ),
        ),
      ),
    );
  }
}

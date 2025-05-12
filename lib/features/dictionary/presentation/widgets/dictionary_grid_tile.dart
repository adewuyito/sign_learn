import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sign_learn/features/dictionary/presentation/dictionary_entry_detail_view.dart';

import '../../../../core/core.dart';
import '../../data/models/dictionary_models.dart';

class DictionaryGridTile extends StatelessWidget {
  const DictionaryGridTile({
    super.key,
    required this.entries,
  });

  final DictionaryEntries entries;

  void _showDictionaryEntryModal(
    BuildContext context,
    DictionaryEntries entries,
  ) {
    showModalBottomSheet(
      useSafeArea: true,
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: appColors.white,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        maxChildSize: 0.9,
        minChildSize: 0.3,
        builder: (context, scrollController) => DictionaryEntryDetailView(
          entries.id,
          youtubeUrl: entries.videoId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDictionaryEntryModal(context, entries),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: appColors.black, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 3.0, left: 3, right: 3),
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: entries.thumbnails.medium,
                  fit: BoxFit.fitHeight,
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

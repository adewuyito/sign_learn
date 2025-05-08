import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import 'providers/dictionary_providers.dart';
import 'widgets/dictionary_grid_tile.dart';

@RoutePage()
class DictionaryView extends ConsumerWidget {
  const DictionaryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dictionaryEntries = ref.watch(dictionaryEntriesProvider);

    return SafeArea(
      minimum: safeAreaPadding,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ASL Vocabulary Builder'),
          scrolledUnderElevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            // ignore: unused_result
            ref.refresh(dictionaryEntriesProvider);
          },
          child: Column(
            children: [
              Expanded(
                child: dictionaryEntries.when(
                  data: (dictionaryList) => GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220.dx,
                      mainAxisSpacing: padding.dy,
                      crossAxisSpacing: padding.dx,
                    ),
                    itemCount: dictionaryList.length,
                    itemBuilder: (context, index) {
                      final entries = dictionaryList[index];
                      return DictionaryGridTile(entries: entries);
                    },
                  ),
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (e, stack) {
                    debugPrint("Error message => ${e.toString()}");
                    debugPrint("Error message => ${stack.toString()}");
                    return Center(child: Text('Error loading Dictionary'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

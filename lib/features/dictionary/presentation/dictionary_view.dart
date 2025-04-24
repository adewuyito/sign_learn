import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/core/core.dart';
import 'package:sign_learn/features/dictionary/data/models/dictionary_models.dart';
import 'package:sign_learn/features/dictionary/presentation/providers/dictionary_providers.dart';
import 'package:sign_learn/routes/sign_learn_router.gr.dart';

import '../../../routes/router.dart';

@RoutePage()
class DictionaryView extends ConsumerWidget {
  const DictionaryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dictionaryEntries = ref.watch(dictionaryEntriesProvider);
    // TODO: Add the search feature for the dicitinoary words
    final sde = DictionaryEntries(
      id: "id",
      term: "term",
      videoUrl: "videoUrl",
      description: "description",
      thumbnailUrl: "thumbnailUrl",
    );

    final dEntries = AsyncValue.data(
      // ! Mock data
      List.generate(20, (index) => sde),
    );

    void onTap(String id) {
      SignNavigator.of(context).push(DictionaryEntryDetailRoute(entryId: id));
    }

    return SafeArea(
      minimum: safeAreaPadding,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ASL Dictionary'),
          scrolledUnderElevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: dEntries.when(
                data: (dictionaryList) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220.dx,
                    mainAxisSpacing: padding.dy,
                    crossAxisSpacing: padding.dx,
                  ),
                  itemCount: dictionaryList.length,
                  itemBuilder: (context, index) {
                    final entries = dictionaryList[index];
                    return GestureDetector(
                      onTap: () => onTap(entries.id),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: appColors.black, width: 2),
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Icon(Icons.error)),
                            Text(entries.term)
                            // TODO Fix the widget to look alright
                          ],
                        ),
                      ),
                    );
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
    );
  }
}

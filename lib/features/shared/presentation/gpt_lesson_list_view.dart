// // lib/providers/lesson_list_provider.dart
// import 'package:auto_route/auto_route.dart';
// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sign_learn/routes/sign_learn_router.gr.dart';
// import 'package:video_player/video_player.dart';

// import '../../lessons/data/models/lesson_model.dart';

// final lessonListProvider =
//     FutureProvider.family<List<LessonModel>, ({String levelId, String unitId})>(
//         (ref, params) {
//   final repo = ref.read(lessonRepositoryProvider);
//   return repo.loadUnitLessons(params.levelId, params.unitId);
// });

// // ~ LessonListView

// @RoutePage()
// class GptLessonListPage extends ConsumerWidget {
//   const GptLessonListPage({
//     super.key,
//     @PathParam('levelId') required this.levelId,
//     @PathParam('unitId') required this.unitId,
//   });

//   final String levelId;
//   final String unitId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final lessonsAsync = ref.watch(
//       lessonListProvider((levelId: levelId, unitId: unitId)),
//     );

//     return Scaffold(
//       appBar: AppBar(title: Text('Unit $unitId • $levelId')),
//       body: lessonsAsync.when(
//         data: (lessons) => _LessonListView(lessons: lessons),
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (e, _) => Center(child: Text('Error: $e')),
//       ),
//     );
//   }
// }

// class _LessonListView extends StatelessWidget {
//   const _LessonListView({required this.lessons});
//   final List<LessonModel> lessons;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       padding: const EdgeInsets.all(16),
//       itemCount: lessons.length,
//       separatorBuilder: (_, __) => const Divider(),
//       itemBuilder: (context, i) {
//         final lesson = lessons[i];
//         return ListTile(
//           leading: CircleAvatar(child: Text('${lesson.order}')),
//           title: Text(lesson.title),
//           subtitle: Text(lesson.description ?? ''),
//           trailing: const Icon(Icons.play_circle_outline),
//           onTap: () => context.pushRoute(
//             LessonRoute(
//               lessonId: lesson.lessonId,
//               clipUrls: lesson.videoUrls,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // ~ LessonPageBody

// class LessonPageBody extends StatefulWidget {
//   const LessonPageBody({
//     super.key,
//     required this.lessonId,
//     required this.clipUrls,
//   });

//   final String lessonId;
//   final List<String> clipUrls;

//   @override
//   State<LessonPageBody> createState() => _LessonPageBodyState();
// }

// class _LessonPageBodyState extends State<LessonPageBody> {
//   late final PageController _pageController;
//   final List<VideoPlayerController> _videoCtrls = [];
//   final List<ChewieController> _chewieCtrls = [];
//   int _current = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();

//     for (final url in widget.clipUrls) {
//       final vp = VideoPlayerController.networkUrl(Uri.parse(url));
//       _videoCtrls.add(vp);
//       _chewieCtrls.add(
//         ChewieController(
//           videoPlayerController: vp,
//           autoInitialize: true,
//           autoPlay: false,
//           showControls: true,
//           allowMuting: true,
//         ),
//       );
//     }

//     // Auto‑advance when a clip finishes
//     for (int i = 0; i < _videoCtrls.length; i++) {
//       _videoCtrls[i].addListener(() {
//         final v = _videoCtrls[i];
//         if (v.value.isInitialized &&
//             v.value.position >= v.value.duration &&
//             mounted) {
//           _onClipFinished(i);
//         }
//       });
//     }
//   }

//   void _onClipFinished(int index) {
//     if (index == widget.clipUrls.length - 1) {
//       _showCompleteDialog();
//     } else {
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void _showCompleteDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) => AlertDialog(
//         title: const Text('Lesson Complete'),
//         content: const Text('Great job!'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
//             child: const Text('Continue'),
//           ),
//         ],
//       ),
//     );
//   }

//   double get _progress => (_current + 1) / widget.clipUrls.length;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Lesson')),
//       body: Column(
//         children: [
//           // Progress bar
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: LinearProgressIndicator(
//               value: _progress,
//               backgroundColor: Colors.grey.shade300,
//               valueColor:
//                   AlwaysStoppedAnimation(Theme.of(context).colorScheme.primary),
//             ),
//           ),
//           // Clip carousel
//           Expanded(
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: widget.clipUrls.length,
//               onPageChanged: (i) => setState(() => _current = i),
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (_, index) => Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: AspectRatio(
//                   aspectRatio: 16 / 9,
//                   child: Chewie(controller: _chewieCtrls[index]),
//                 ),
//               ),
//             ),
//           ),
//           // Manual next button (optional)
//           if (_current < widget.clipUrls.length - 1)
//             Padding(
//               padding: const EdgeInsets.only(bottom: 24),
//               child: ElevatedButton.icon(
//                 onPressed: () => _onClipFinished(_current),
//                 icon: const Icon(Icons.arrow_forward),
//                 label: const Text('Next clip'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     for (final c in _chewieCtrls) {
//       c.dispose();
//     }
//     for (final v in _videoCtrls) {
//       v.dispose();
//     }
//     super.dispose();
//   }
// }

// // ~ LessonDetailView

// @RoutePage()
// class LessonPage extends StatelessWidget {
//   const LessonPage({
//     super.key,
//     required this.lessonId,
//     required this.clipUrls,
//   });

//   final String lessonId;
//   final List<String> clipUrls;

//   @override
//   Widget build(BuildContext context) {
//     return LessonPageBody(
//       // the widget from previous answer
//       lessonId: lessonId,
//       clipUrls: clipUrls,
//     );
//   }
// }


// /* 

 

// */
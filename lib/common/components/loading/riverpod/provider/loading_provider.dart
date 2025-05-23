import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/features.dart';



final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authNotifierProvider);

  // final isUploading = ref.watch(imageUploadProvider);
  // final isSendingComment = ref.watch(sendCommentProvider);
  // final isDeletingComment = ref.watch(deleteCommentProvider);
  // final isDeletingPost = ref.watch(deletePostProvider);

  return authState.isLoading;
  // isUploading ||
  // isSendingComment ||
  // isDeletingComment ||
  // isDeletingPost;
});

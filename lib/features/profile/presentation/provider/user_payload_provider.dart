// Define a StateNotifierProvider for the UserNotifier
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/user_model.dart' show UserInfoModel;
import 'user_payload_notifier.dart' show UserPayloadNotifier;

// final userProvider = StateNotifierProvider<UserProfileNotifier, UserInfoModel>((ref) {
//   return UserProfileNotifier();
// });


final userNotiferProvider = NotifierProvider<UserPayloadNotifier, UserInfoModel>(UserPayloadNotifier.new);
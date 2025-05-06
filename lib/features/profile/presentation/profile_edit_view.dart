import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/profile/presentation/widget/sign_profile_image.dart';
import 'package:sign_learn/routes/router.dart';

import '../../../common/commons.dart';
import '../../../core/core.dart';
import '../../features.dart';
import 'provider/user_payload_provider.dart';

@RoutePage()
class ProfileEditView extends HookConsumerWidget {
  const ProfileEditView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userNotiferProvider);

    final _nameController = useTextEditingController(text: user.fullname);
    final _emailController = useTextEditingController(text: user.email ?? "");

    final hasChanged = useState(false); // Track whether the text has changed

    // Add a listener to detect when the value changes
    useEffect(() {
      _emailController.addListener(() {
        // Update hasChanged if the current text differs from the initial value
        hasChanged.value = _emailController.text != user.email;

        // For debugging (optional): you can print to see what's happening
        debugPrint("Text has changed: ${hasChanged.value}");
      });

      // Cleanup the listener when the widget is disposed
      return () => _emailController.dispose();
    }, [_emailController]);

    /*    void _uploadImage(UserId id) async {
      final _image = await ImagePickerHelper.pickImageFromGallary();

      if (_image == null && context.mounted) {
        SnackbarUtils.of(context)
            .errorSnackBar("Unable to get image from Gallery");
        return;
      }

      final _firebaseUser = FirebaseAuth.instance.currentUser;

      if (_firebaseUser != null) {
        final taskRef =
            FirebaseStorage.instance.ref().child(id).child('images');

        final task = taskRef.putFile(_image!);
        task.whenComplete(() {
          SnackbarUtils.of(context).errorSnackBar("Image Uploaded successfuly");
        });
        final imageDownload = await taskRef.getDownloadURL();

        ref
            .read(userProvider.notifier)
            .updateUser(id: id, displayImage: imageDownload);
      }
    } */

    void _saveChanges() async {
      final savedChanges = await SaveDialog().present(context).then(
            (value) => value ?? false,
          );
      if (savedChanges) {
        User? firebase = FirebaseAuth.instance.currentUser;
        try {
          await firebase!.verifyBeforeUpdateEmail(_emailController.text);

          // Updates the auth state
          if (context.mounted) {
            ref
                .read(authNotifierProvider.notifier)
                .updateUserName(name: _nameController.text, context: context);
            // Updates the user profile
            ref.read(userNotiferProvider.notifier).updateUser(
                  id: user.userId,
                  name: _nameController.text,
                  email: _emailController.text,
                );
          }
        } catch (e) {
          if (context.mounted) {
            debugPrint("Error: $e");
            SnackbarUtils.of(context)
                .signSnackBar("An error occured while saving new changes");
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.navigate_before_rounded),
          onTap: () {
            SignNavigator.of(context).pop();
          },
        ),
        title: const Text("Edit Profile"),
      ),
      body: SafeArea(
        minimum: safeAreaPadding,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 26),
                      child: ProfileImage(
                        image:
                            ref.watch(userNotiferProvider).displayImage ?? "",
                        editImage: () async {
                          // _uploadImage(ref.watch(userNotiferProvider).userId);
                        },
                      ),
                    ),
                  ),
                  InputModel(controller: _nameController, label: "Name"),
                  const YBox(25),
                  Text("Email"),
                  InputModel(controller: _emailController, label: "email"),
                ],
              ),
            ),
            // GDButtonWidget(
            //   label: "Save",
            //   onPressed: _saveChanges,
            // )
          ],
        ),
      ),
    );
  }
}

/* () async {
                      // Pick A Image
                      final imageFile =
                          await ImagePickerHelper.pickImageFromGallary();
                      if (imageFile == null) return;

                      // ref.invalidate(postSettingprovider);

                      if (!context.mounted) return;

                      debugPrint("Image: ${imageFile.path}");

                      String? userId = ref.watch(userIdProvider);
                      if (userId == null) return;

                      final isUploaded = await ref
                          .read(
                            imageUploadProvider.notifier,
                          )
                          .upload(
                            file: imageFile,
                            fileType: FileType.image,
                            userId: userId,
                          );

                      log('$isUploaded => is Uploaded');
                      log('${context.mounted} => is mounted');
                      if (isUploaded && context.mounted) {
                        debugPrint("Image Uploaded");
                      } else {
                        debugPrint("Image not Uploaded");
                      }
                      debugPrint("Debug print 6");
                    } */

// @immutable
// class ImagePickerHelper {
//   static final _imagePicker = ImagePicker();

//   static Future<File?> pickImageFromGallary() =>
//       _imagePicker.pickImage(source: ImageSource.gallery).toFile;
// }

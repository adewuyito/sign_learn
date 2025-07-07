import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/commons.dart';
import '../../../core/core.dart';
import '../../../routes/router.dart';
import 'provider/user_payload_provider.dart';
import 'widget/sign_profile_image.dart';

@RoutePage()
class ProfileEditView extends StatefulHookConsumerWidget {
  const ProfileEditView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileEditViewState();
}

class _ProfileEditViewState extends ConsumerState<ProfileEditView> {
  @override
  Widget build(BuildContext context) {
    final user = ref.read(userNotiferProvider);

    final _nameController = useTextEditingController(text: user.displayName);
    final _emailController = useTextEditingController(text: user.email ?? "");
    final hasChanged = useState(false);

    // Detect email changes
    useEffect(() {
      void listener() {
        hasChanged.value = _emailController.text != user.email ||
            _nameController.text != user.displayName;
      }

      _emailController.addListener(listener);
      _nameController.addListener(listener);
      return () {
        _nameController.removeListener(listener);
        _emailController.removeListener(listener);
      };
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.navigate_before_rounded),
          onTap: () => SignNavigator.of(context).pop(),
        ),
        title: const Text("Edit Profile"),
      ),
      body: SafeArea(
        minimum: safeAreaPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const YBox(20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 26),
                  child: ProfileImage(
                    editImage: () async {
                      // Implement image upload functionality here
                    },
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextTheme.of(context)
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  InputModel(controller: _nameController, label: "Name"),
                  const YBox(25),
                  Text(
                    "Email",
                    style: TextTheme.of(context)
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  InputModel(
                    controller: _emailController,
                    label: "Email",
                    // readOnly: true, // Optional, based on your auth flow
                  ),
                ],
              ),
              const YBox(40),
              if (hasChanged.value)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SignActionButton(
                    onPressed: () {},
                    color: appColors.buttonYellow,
                    label: "Save",
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

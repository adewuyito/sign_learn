import 'package:flutter/material.dart';
import 'package:sign_learn/gen/assets.gen.dart';
import '../../../../core/core.dart' show appColors; // TODO: Work On this file

class ProfileImage extends StatelessWidget {
  final Size size;
  const ProfileImage({
    super.key,
    this.editImage,
    this.size = const Size(125, 125),
  });

  final VoidCallback? editImage;

  @override
  Widget build(BuildContext context) {
    final String _dafualtProfile = Assets.defaultProfile.path;
    return GestureDetector(
      onTap: editImage,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(125),
              border: Border.all(
                width: 3,
                color: Colors.black,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: Container(
              width: size.width,
              height: size.height,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(125),
                border: Border.all(
                  width: 1,
                  color: Colors.white,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: Image.asset(
                _dafualtProfile,
                fit: BoxFit.cover,
              ),
              // CachedNetworkImage( // TODO: Fix with better implementation
              //   imageUrl: image,
              //   fit: BoxFit.cover,
              //   alignment: Alignment.topCenter,
              //   errorWidget: (context, url, error) => Image.asset(
              //     "assets/profile_image.png",
              //     fit: BoxFit.cover,
              //     alignment: Alignment.topCenter,
              //   ),
              // ),
            ),
          ),
          editImage != null
              ? Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: appColors.grey767676,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.mode_edit_outline_outlined,
                    color: appColors.greyF6F6F6,
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

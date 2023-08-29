import 'package:croppy/src/src.dart';
import 'package:flutter/material.dart';

class MaterialImageCropperBottomAppBar extends StatelessWidget {
  const MaterialImageCropperBottomAppBar({
    super.key,
    required this.controller,
    required this.shouldPopAfterCrop,
  });

  final CroppableImageController controller;
  final bool shouldPopAfterCrop;

  @override
  Widget build(BuildContext context) {
    final l10n = CroppyLocalizations.of(context)!;

    return Container(
      // decoration: BoxDecoration(
      //   border: Border(
      //     top: Divider.createBorderSide(context),
      //   ),
      // ),
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Row(
          children: [
            SizedBox(
              height: 40.0,
              child: TextButton(
                onPressed: () => Navigator.maybePop(context),
                child: Text(
                  l10n.cancelLabel,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 40.0,
              child: FutureButton(
                onTap: () async {
                  CroppableImagePageAnimator.of(context)
                      ?.setHeroesEnabled(true);

                  final result = await controller.crop();

                  if (context.mounted && shouldPopAfterCrop) {
                    Navigator.of(context).pop(result);
                  }
                },
                builder: (context, onTap) => TextButton(
                  onPressed: onTap,
                  child: const Text(
                    "Choose",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

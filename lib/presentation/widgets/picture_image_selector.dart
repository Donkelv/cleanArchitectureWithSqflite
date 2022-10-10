import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_technology/data/utils/exports.dart';
import 'package:mobile_technology/domain/notifier/create_customer_notifier.dart';


class PictureImageSelector extends ConsumerWidget {
  const PictureImageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150.0.h,
      width: size.width,
      decoration: BoxDecoration(
        color: ColorConst().whiteColor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: ColorConst().grayColor300, width: 1.0),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            ref.watch(customerRegProvider.notifier).takePicture();
          },
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
              child: ref
                      .watch(customerRegProvider.notifier)
                      .picture
                      .text
                      .isEmpty
                  ? Text(
                      "Kindly select an image to continue",
                      textAlign: TextAlign.center,
                      style: smallText().copyWith(
                        color: ColorConst().grayColor700,
                      ),
                    )
                  : Image.file(File(
                      ref.watch(customerRegProvider.notifier).picture.text)),
            ),
          ),
        ),
      ),
    );
  }
}

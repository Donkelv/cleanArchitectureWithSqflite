



import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_technology/data/utils/exports.dart';
import 'package:mobile_technology/domain/notifier/create_customer_notifier.dart';

class PassportImageSelector extends ConsumerStatefulWidget {
  const PassportImageSelector({Key? key}) : super(key: key);

  @override
  ConsumerState<PassportImageSelector> createState() => _PassportImageSelectorState();
}

class _PassportImageSelectorState extends ConsumerState<PassportImageSelector> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150.0.h,
      width: size.width,
      decoration: BoxDecoration(
        color: ColorConst().whiteColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: ColorConst().grayColor300, width: 1.0),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: () {
            ref.watch(customerRegProvider.notifier).pickPassport().then((value) => setState(() {
              }),);
          },
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
              child: ref
                      .watch(customerRegProvider.notifier)
                      .passport
                      .text
                      .isEmpty
                  ? 
                  const Icon(Icons.add_photo_alternate_rounded)
                 
                  : Image.file(File(
                      ref.watch(customerRegProvider.notifier).passport.text)),
            ),
          ),
        ),
      ),
    );
  }
}

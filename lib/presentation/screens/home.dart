import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_technology/data/utils/exports.dart';
import 'package:mobile_technology/domain/notifier/create_customer_notifier.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  DateTime todaysDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  bool adult = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(todaysDate.year - 100),
        lastDate: todaysDate);
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        if (todaysDate.year - picked.year < 18) {
          adult = false;
        } else {
          adult = true;
        }
        ref.read(customerRegProvider.notifier).dob.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.dark,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.0.h,
                  ),
                  Text(
                    "Create an account",
                    style: largeTextInter()
                        .copyWith(color: ColorConst().grayColor700),
                  ),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  Text(
                    "First Name",
                    style: normalText().copyWith(
                        color: ColorConst().grayColor700,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6.0.h,
                  ),
                  CustomTextField(
                    controller:
                        ref.read(customerRegProvider.notifier).firstName,
                    hintText: null,
                  ),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  Text(
                    "Last Name",
                    style: normalText().copyWith(
                        color: ColorConst().grayColor700,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6.0.h,
                  ),
                  CustomTextField(
                    controller: ref.read(customerRegProvider.notifier).lastName,
                    hintText: null,
                  ),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  Text(
                    "Date of birth",
                    style: normalText().copyWith(
                        color: ColorConst().grayColor700,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6.0.h,
                  ),
                  CustomTextField(
                    controller: ref.read(customerRegProvider.notifier).dob,
                    //enabled: false,
                    hintText: "00/00/0000",
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    child: adult == true
                        ? passortSelection(size)
                        : const SizedBox.shrink(),
                  ),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  Text(
                    "Email",
                    style: normalText().copyWith(
                        color: ColorConst().grayColor700,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6.0.h,
                  ),
                  CustomTextField(
                    controller: ref.read(customerRegProvider.notifier).email,
                    textInputType: TextInputType.emailAddress,
                    hintText: null,
                  ),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  Text(
                    "Picture",
                    style: normalText().copyWith(
                        color: ColorConst().grayColor700,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6.0.h,
                  ),
                  ImageSelector(
                    size: size,
                    image: ref.watch(customerRegProvider.notifier).picture.text,
                    onTap: () {
                      ref.watch(customerRegProvider.notifier).takePicture();
                    },
                  ),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  CustomButton(
                    size: size,
                    onTap: () {
                      ref.watch(customerRegProvider.notifier).createCustomer();
                    },
                    text: "Submit",
                  ),
                  SizedBox(
                    height: 50.0.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget passortSelection(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.0.h,
        ),
        Text(
          "Passort",
          style: normalText().copyWith(
              color: ColorConst().grayColor700, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 6.0.h,
        ),
        ImageSelector(
          size: size,
          image: ref.watch(customerRegProvider.notifier).passport.text,
          onTap: () {
            ref.watch(customerRegProvider.notifier).pickPassport();
          },
        )
      ],
    );
  }
}

class ImageSelector extends StatelessWidget {
  const ImageSelector({
    Key? key,
    required this.size,
    required this.image,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final void Function()? onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
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
          onTap: onTap,
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
              child: image.isEmpty
                  ? Text(
                      "Kindly select an image to continue",
                      textAlign: TextAlign.center,
                      style: smallText().copyWith(
                        color: ColorConst().grayColor700,
                      ),
                    )
                  : Image.file(File(image)),
            ),
          ),
        ),
      ),
    );
  }
}

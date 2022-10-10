import 'package:mobile_technology/data/utils/exports.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.dark,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: ColorConst().whiteColor,
        body: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70.0.h,
                ),
                Text(
                  "Successful",
                  style:
                      largeTextInter().copyWith(color: ColorConst().greenColor),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Text(
                  "Successfully created account",
                  style: normalText().copyWith(
                    color: ColorConst().grayColor700,
                  ),
                ),
                SizedBox(
                  height: 40.0.h,
                ),
                Image.asset("assets/success.gif"),
                SizedBox(
                  height: 145.0.h,
                ),
                CustomButton(
                    size: size,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: "Go back"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

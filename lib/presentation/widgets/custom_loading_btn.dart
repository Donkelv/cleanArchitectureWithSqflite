import 'package:mobile_technology/data/utils/exports.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    Key? key,
    required this.size,
    required this.text,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final Size size;

  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0.h,
      width: size.width,
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorConst().primaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 16.0.h,
            width: 16.0.w,
            child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorConst().whiteColor)),
          ),
          SizedBox(
            width: 12.0.w,
          ),
          Text(
            text,
            style: mediumTextInter()
                .copyWith(color: textColor ?? ColorConst().whiteColor),
          ),
        ],
      ),
    );
  }
}

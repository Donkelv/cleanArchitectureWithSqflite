import 'package:mobile_technology/data/utils/exports.dart';

///Custom Button
///Parameters are [size], [onTap], [text], [backgroundColor], [textColor]
///
///

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.size,
    required this.onTap,
    required this.text,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final Size size;
  final VoidCallback onTap;
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
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Center(
            child: Text(
              text,
              style: mediumTextInter()
                  .copyWith(color: textColor ?? ColorConst().whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}

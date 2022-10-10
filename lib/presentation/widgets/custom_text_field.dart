


import '../../data/utils/exports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.obscureText,
    this.textInputType,
    this.onEditingComplete,
    this.onFocusChange,
    this.onChanged,
    this.maxLines, this.onTap, this.enabled,

  }) : super(key: key);
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? textInputType;
  final void Function()? onEditingComplete;
  final void Function(bool)? onFocusChange;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool? enabled;
  final int? maxLines;
 

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: onFocusChange,
      child: TextFormField(
        enabled: enabled ?? true,
        onTap: onTap,
        maxLines: maxLines ?? 1,
        keyboardType: textInputType ?? TextInputType.name,
        obscureText: obscureText ?? false,
        obscuringCharacter: "•",
        controller: controller,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        style: TextStyle(color: ColorConst().blackColor), 
        decoration: InputDecoration(
         
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 14.0.w),
          hintText: hintText,
          hintStyle:
              mediumTextInter().copyWith(color: ColorConst().grayColor300),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                BorderSide(color: ColorConst().grayColor300, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                BorderSide(color: ColorConst().primaryColor, width: 0.5),
          ),
        ),
      ),
    );
  }
}

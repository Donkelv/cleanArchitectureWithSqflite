
import 'package:mobile_technology/data/utils/exports.dart';




class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController passport = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController picture = TextEditingController();


  @override
  void dispose() {
    firstName.clear();
    lastName.clear();
    dob.clear();
    passport.clear();
    email.clear();
    picture.clear();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.0.h,
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
                 CustomTextField(
                  controller: firstName,
                  hintText: null,
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
                  controller: lastName,
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
                  controller: dob,
                  hintText: "00/00/0000",
                ),
                SizedBox(
                  height: 30.0.h,
                ),
                Text(
                  "Passort",
                  style: normalText().copyWith(
                      color: ColorConst().grayColor700,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 6.0.h,
                ),
                CustomTextField(
                  controller: passport,
                  hintText: null,
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
                  controller: email,
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
                CustomTextField(
                  controller: picture,
                  hintText: null,
                ),
                SizedBox(
                  height: 30.0.h,
                ),

                CustomButton(
                  size: size, 
                  onTap: (){

                }, 
                text: "Submit",
                ),



            ],
          ),
        )
      ),
    );
  }
}

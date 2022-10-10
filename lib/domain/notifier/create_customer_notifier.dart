import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_technology/data/repository/database.dart';
import 'package:mobile_technology/data/repository/database_impl.dart';
import 'package:mobile_technology/data/utils/permission_handler.dart';
import 'package:mobile_technology/domain/freezed/data_req.dart';
import 'package:device_information/device_information.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../data/utils/exports.dart';

class CreateCustomerNotifier extends StateNotifier<DataReqState> {
  CreateCustomerNotifier({
    required this.ref,
    required BaseCustomerRegDatabaseRepository
        baseCustomerRegDatabaseRepository,
  })  : _baseCustomerRegDatabaseRepository = baseCustomerRegDatabaseRepository,
        super(const DataReqState.initial());

  final Ref ref;
  final BaseCustomerRegDatabaseRepository _baseCustomerRegDatabaseRepository;

  //TextEditing controllers
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController passport = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController picture = TextEditingController();
  TextEditingController imei = TextEditingController();

  ///Image Picker
  Future<void> pickPassport() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? imageFile;
    File? file;
    String? filePath;
    try {
      imageFile = await imagePicker.pickImage(source: ImageSource.gallery);
      file = File(imageFile!.path);
      filePath = file.path;

      passport.text = filePath;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> takePicture() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? imageFile;
    File? file;
    String? filePath;
    try {
      imageFile = await imagePicker.pickImage(source: ImageSource.camera);
      file = File(imageFile!.path);
      filePath = file.path;
      picture.text = filePath;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  ///Create Customer
  Future<void> createCustomer() async {
    state = const DataReqState.loading();
    final PermissionStatus permissionStatus = await getPhonePermission();
    debugPrint(permissionStatus.name);
    imei.text = await DeviceInformation.deviceIMEINumber;

    debugPrint(imei.text);
    if (firstName.text.isEmpty ||
        lastName.text.isEmpty ||
        dob.text.isEmpty ||
        picture.text.isEmpty) {
      Fluttertoast.showToast(
          msg:
              "Kindly fill in your first name, last name, dob and take a picture to continue",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ColorConst().blackColor,
          textColor: ColorConst().whiteColor,
          fontSize: 14.0.sp);
    } else {
      final response = await _baseCustomerRegDatabaseRepository.createCustomer(
          imei.text,
          firstName.text,
          lastName.text,
          dob.text,
          passport.text,
          email.text,
          picture.text);
      response.fold(
        (l) {
          state = DataReqState.error(failure: l);
          Fluttertoast.showToast(
              msg: l.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: ColorConst().blackColor,
              textColor: ColorConst().whiteColor,
              fontSize: 14.0.sp);
        },
        (r) {
          state = DataReqState.data(data: r);
          firstName.clear();
          dob.clear();
          lastName.clear();
          passport.clear();
          imei.clear();
          picture.clear();
          email.clear();
          Fluttertoast.showToast(
              msg: "Successfully registered",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: ColorConst().blackColor,
              textColor: ColorConst().whiteColor,
              fontSize: 14.0.sp);
        },
      );
    }
  }
}

final customerRegProvider =
    StateNotifierProvider<CreateCustomerNotifier, DataReqState>((ref) {
  return CreateCustomerNotifier(
      ref: ref,
      baseCustomerRegDatabaseRepository:
          ref.watch(customerRegDatabaseProvider));
});

final customerRegDatabaseProvider = Provider<BaseCustomerRegDatabaseRepository>(
    (ref) => CustomerRegDatabaseRepository());

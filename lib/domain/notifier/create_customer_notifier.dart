import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_technology/data/repository/database.dart';
import 'package:mobile_technology/data/repository/database_impl.dart';
import 'package:mobile_technology/domain/freezed/data_req.dart';

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

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController passport = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController picture = TextEditingController();

  Future<void> createCustomer(
      {required String imei,
      required String firstName,
      required String lastName,
      required String dob,
      final String? passport,
      final String? email,
      required String picture}) async {
    state = const DataReqState.loading();
    final response = await _baseCustomerRegDatabaseRepository.createCustomer(
        imei, firstName, lastName, dob, passport, email, picture);
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

final customerRegProvider =
    StateNotifierProvider<CreateCustomerNotifier, DataReqState>((ref) {
  return CreateCustomerNotifier(
      ref: ref,
      baseCustomerRegDatabaseRepository:
          ref.watch(customerRegDatabaseProvider));
});

final customerRegDatabaseProvider = Provider<BaseCustomerRegDatabaseRepository>(
    (ref) => CustomerRegDatabaseRepository());

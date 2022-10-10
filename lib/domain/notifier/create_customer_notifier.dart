import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_technology/data/repository/database.dart';
import 'package:mobile_technology/data/repository/database_impl.dart';
import 'package:mobile_technology/domain/freezed/database.dart';

import '../../data/utils/exports.dart';

class CreateCustomerNotifier extends StateNotifier<DatabaseState> {
  CreateCustomerNotifier({
    required this.ref,
    required BaseCustomerRegDatabaseRepository
        baseCustomerRegDatabaseRepository,
  })  : _baseCustomerRegDatabaseRepository = baseCustomerRegDatabaseRepository,
        super(const DatabaseState.initial());

  final Ref ref;
  final BaseCustomerRegDatabaseRepository _baseCustomerRegDatabaseRepository;

  Future<void> createCustomer(
      {required String imei,
      required String firstName,
      required String lastName,
      required String dob,
      final String? passport,
      final String? email,
      required String picture}) async {
    state = const DatabaseState.loading();
    final response = await _baseCustomerRegDatabaseRepository.createCustomer(
        imei, firstName, lastName, dob, passport, email, picture);
    response.fold(
      (l) {
        state = DatabaseState.error(error: l.message);
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
        state = DatabaseState.data(success: r);
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
    StateNotifierProvider<CreateCustomerNotifier, DatabaseState>((ref) {
  return CreateCustomerNotifier(
      ref: ref, baseCustomerRegDatabaseRepository: ref.watch(customerRegDatabaseProvider));
});



final customerRegDatabaseProvider =
    Provider<BaseCustomerRegDatabaseRepository>((ref) => CustomerRegDatabaseRepository());

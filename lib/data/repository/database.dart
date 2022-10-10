import 'package:mobile_technology/data/entity/customer_reg_entity.dart';
import 'package:mobile_technology/data/entity/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCustomerRegDatabaseRepository {
  Future<Either<Failure, CustomerRegEntity>> createCustomer(
      final String imei,
      final String firstName,
      final String lastName,
      final String dob,
      final String? passport,
      final String? email,
      final String picture);
}

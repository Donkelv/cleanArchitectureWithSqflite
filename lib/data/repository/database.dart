import 'package:mobile_technology/data/entity/customer_reg_entity.dart';

abstract class BaseCustomerRegDatabaseRepository {
  Future<CustomerRegEntity> createCustomer(final String imei, final String firstName, final String lastName, final String dob, final String? passport, final String? email, final String picture);
}

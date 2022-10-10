


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_technology/data/entity/customer_reg_entity.dart';


part 'database.freezed.dart';

extension GetDatabaseStateGetters on DatabaseState {
  bool get isLoading => this is _DatabaseStateLoading;
  bool get isData => this is _DatabaseStateData;
  bool get isError => this is _DatabaseStateError;
}

@freezed
class DatabaseState with  _$DatabaseState {
  const factory DatabaseState.initial() = _DatabaseStateInitial;
  const factory DatabaseState.loading() = _DatabaseStateLoading;
  const factory DatabaseState.data({required CustomerRegEntity success}) = _DatabaseStateData;
  const factory DatabaseState.error({required String error}) = _DatabaseStateError;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_technology/data/entity/customer_reg_entity.dart';
import 'package:mobile_technology/data/entity/failure.dart';

part 'data_req.freezed.dart';

extension GetDataReqStateGetters on DataReqState {
  bool get isLoading => this is _DataReqStateLoading;
  bool get isData => this is _DataReqStateData;
  bool get isError => this is _DataReqStateError;
}

@freezed
class DataReqState with _$DataReqState {
  const factory DataReqState.initial() = _DataReqStateInitial;
  const factory DataReqState.loading() = _DataReqStateLoading;
  const factory DataReqState.data({required CustomerRegEntity data}) =
      _DataReqStateData;
  const factory DataReqState.error({required Failure failure}) =
      _DataReqStateError;
}

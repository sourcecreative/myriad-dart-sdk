import 'package:chopper/chopper.dart';

import '../model/response/validation_response.dart';
import '../model/validation.dart';

part "validation_service.chopper.dart";

@ChopperApi(baseUrl:"/validations")
abstract class ValidationService extends ChopperService {
  static ValidationService newInstance([ChopperClient client]) => _$ValidationService(client);

  @Post()
  Future<Response<ValidationResponse>> validate(@Body() Validation validation);
}
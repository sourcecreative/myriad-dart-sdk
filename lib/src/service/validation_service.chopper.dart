// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ValidationService extends ValidationService {
  _$ValidationService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ValidationService;

  Future<Response<ValidationResponse>> validate(Validation validation) {
    final $url = '/validations/';
    final $body = validation;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ValidationResponse, ValidationResponse>($request);
  }
}

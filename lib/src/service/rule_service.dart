import 'package:chopper/chopper.dart';
import 'package:myriad_dart_sdk/src/model/response/rule_response.dart';
import 'package:myriad_dart_sdk/src/model/rule.dart';

part "rule_service.chopper.dart";

@ChopperApi(baseUrl:"/rules")
abstract class RuleService extends ChopperService {
  static RuleService newInstance([ChopperClient client]) => _$RuleService(client);

  @Post()
  Future<Response<RuleResponse>> create(@Body() Rule tier);

  @Get(path:"/{id}")
  Future<Response<RuleResponse>> findById(@Path() String id);

  @Put(path:"/{id}")
  Future<Response<RuleResponse>> update(@Path() String id, @Body() Rule tier);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

  @Get()
  Future<Response<PaginatedRuleResponse>> list({@QueryMap() Map<String,dynamic> filter = const <String,dynamic>{}, 
    @Query() int page=1, @Query() int size=20});

}
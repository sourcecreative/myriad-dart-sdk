import 'package:chopper/chopper.dart';
import 'package:myriad_dart_sdk/src/model/tier.dart';

part "promotion_service.chopper.dart";

@ChopperApi(baseUrl:"/tiers")
abstract class TierService extends ChopperService {
  static TierService newInstance([ChopperClient client]) => _$TierService(client);

  @Post()
  Future<Response<TierResponse>> create(@Body() Tier tier);

  @Get(path:"/{id}")
  Future<Response<TierResponse>> findById(@Path() String id);

  @Put(path:"/{id}")
  Future<Response<TierResponse>> update(@Path() String id, @Body() Tier tier);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

  @Get()
  Future<Response<PaginatedTierResponse>> list({@QueryMap() Map<String,dynamic> filter = const <String,dynamic>{}, 
    @Query() int page=1, @Query() int size=20});

}
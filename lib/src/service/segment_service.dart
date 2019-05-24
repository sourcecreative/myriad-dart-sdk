import 'package:chopper/chopper.dart';

import 'package:myriad_dart_sdk/src/model/segment.dart';

part "segment_service.chopper.dart";

@ChopperApi(baseUrl:"/orders")
abstract class SegmentService extends ChopperService {
  static SegmentService newInstance([ChopperClient client]) => _$SegmentService(client);

  @Post()
  Future<Response<SegmentResponse>> create(@Body() Segment segment);

  @Get(path:"/{id}")
  Future<Response<SegmentResponse>> findById(@Path() String id);

  @Get()
  Future<Response<PaginatedSegmentResponse>> list({@QueryMap() Map<String,dynamic> filter = const <String,dynamic>{}, 
    @Query() int page=1, @Query() int size=20});

  @Put(path:"/{id}")
  Future<Response<SegmentResponse>> update(@Path() String id, @Body() Segment segment);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

}
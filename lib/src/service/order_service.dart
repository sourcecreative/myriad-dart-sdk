import 'package:chopper/chopper.dart';

import 'package:myriad_dart_sdk/src/model/order.dart';

part "order_service.chopper.dart";

@ChopperApi(baseUrl:"/orders")
abstract class OrderService extends ChopperService {
  static OrderService newInstance([ChopperClient client]) => _$OrderService(client);

  @Post()
  Future<Response<OrderResponse>> create(@Body() CreateOrderRequest order);

  @Get(path:"/{id}")
  Future<Response<OrderResponse>> findById(@Path() String id);

  @Get()
  Future<Response<PaginatedOrderResponse>> list({@QueryMap() Map<String,dynamic> filter = const <String,dynamic>{}, 
    @Query() int page=1, @Query() int size=20});

  @Put(path:"/{id}")
  Future<Response<OrderResponse>> update(@Path() String id, @Body() Order order);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

}
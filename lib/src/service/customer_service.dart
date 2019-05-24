import 'package:chopper/chopper.dart';

import 'package:myriad_dart_sdk/src/model/customer.dart';

part "customer_service.chopper.dart";

@ChopperApi(baseUrl:"/customers")
abstract class CustomerService extends ChopperService {
  static CustomerService newInstance([ChopperClient client]) => _$CustomerService(client);

  @Post()
  Future<Response<CustomerResponse>> create(@Body() Customer customer);

  @Get(path:"/{id}")
  Future<Response<CustomerResponse>> findById(@Path() String id);

  @Get()
  Future<Response<PaginatedCustomerResponse>> list({@QueryMap() Map<String,dynamic> filter = const <String,dynamic>{}, 
    @Query() int page=1, @Query() int size=20});

  @Put(path:"/{id}")
  Future<Response<CustomerResponse>> update(@Path() String id, @Body() Customer customer);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

  @Put()
  Future<Response<BatchUpdateCustomerResponse>> batchUpdate(@Body() BatchUpdateCustomerRequest customers);

}
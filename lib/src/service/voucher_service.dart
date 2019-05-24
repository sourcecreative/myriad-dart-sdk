import 'package:chopper/chopper.dart';
import 'package:myriad_dart_sdk/src/model/distribution.dart';
import 'package:myriad_dart_sdk/src/model/voucher.dart';
import 'package:myriad_dart_sdk/src/model/voucher_config.dart';

part "voucher_service.chopper.dart";

@ChopperApi(baseUrl:"/vouchers")
abstract class VoucherService extends ChopperService {
  static VoucherService newInstance([ChopperClient client]) => _$VoucherService(client);

  @Post()
  Future<Response<VoucherResponse>> create(@Body() Voucher voucher);

  @Get(path:"/{id}")
  Future<Response<VoucherResponse>> findById(@Path() String id);

  @Get()
  Future<Response<PaginatedVoucherResponse>> list({@Query() int page=1, @Query() int size=20});

  @Put(path:"/{id}")
  Future<Response<VoucherResponse>> update(@Path() String id, @Body() UpdateVoucher campaign);

  @Patch(path:"/{id}")
  Future<Response<VoucherResponse>> enable(@Path() String id, @Body() bool enabled);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

  @Post(path:"/import")
  Future<Response<ImportVoucherResponse>> import(@Body() List<Voucher> voucher);

  /// Distribute a voucher to a customer
  /// @id voucher id
  /// @distribution a distribution request
  @Post(path:"/{id}/distributions")
  Future<Response<VoucherDistributionResponse>> distribute(@Path() String id, @Body() DistributeVoucher distribution);
}
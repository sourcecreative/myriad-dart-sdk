import 'package:chopper/chopper.dart';

import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/distribution.dart';
import 'package:myriad_dart_sdk/src/model/voucher.dart';
import 'package:myriad_dart_sdk/src/model/voucher_config.dart';

part "campaign_service.chopper.dart";

@ChopperApi(baseUrl:"/campaigns")
abstract class CampaignService extends ChopperService {
  static CampaignService newInstance([ChopperClient client]) => _$CampaignService(client);

  @Post()
  Future<Response<VoucherCampaignResponse>> create(@Body() VoucherCampaign campaign);

  @Get(path:"/{id}")
  Future<Response<VoucherCampaignResponse>> findById(@Path() String id);

  @Get()
  Future<Response<PaginatedCampaignResponse>> list({@QueryMap() Map<String,dynamic> filter = const <String,dynamic>{}, 
    @Query() int page=1, @Query() int size=20});

  @Put(path:"/{id}")
  Future<Response<VoucherCampaignResponse>> update(@Path() String id, @Body() UpdateCampaign campaign);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

  @Post(path:"/{id}/vouchers")
  Future<Response<VoucherResponse>> addVoucher(@Path() String id, @Body() Voucher voucher);

  @Post(path:"/{id}/vouchers/import")
  Future<Response<ImportVoucherResponse>> importVouchers(@Path() String id, @Body() List<Voucher<VoucherConfig>> voucher);

  @Get(path:"/{id}/distributions")
  Future<Response<PaginatedVoucherDistributionResponse>> listDistributions(@Path() String id, {
    @Query() int page = 1, @Query() int size = 20});

  @Post(path:"/{id}/distributions")
  Future<Response<VoucherDistributionResponse>> distribute(@Path() String id, @Body() DistributeVoucher distribution);

  /// Generates and distributes vouchers
  @Post(path:"/{id}/distributions")
  Future<Response<DistributeBatchVouchersResponse>> distributeVouchers(@Path() String id, @Body() DistributeBatchVouchers distributions);
}
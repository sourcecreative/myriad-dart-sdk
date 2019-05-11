
import 'package:myriad_dart_sdk/myriad_dart_sdk.dart';
import 'package:myriad_dart_sdk/src/repository/campaign_repository.dart';

class CampaignModule {
  final MyriadConnection connection;

  CampaignService get campaigns => 
    CampaignService(CampaignRepository(CampaignApiProvider(connection)));

  CampaignModule(this.connection);

}
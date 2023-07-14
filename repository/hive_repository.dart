import 'package:ismarliyorum/services/hive_client.dart';
import 'package:ismarliyorum/utils/locator.dart';

class HiveRepository {
  late final HiveClient hiveClient = locator<HiveClient>();

  void setIntroValue() async {
    hiveClient.setIntroValue();
  }

  Future<bool?> getIntroValue() async {
    return await hiveClient.getIntroValue();
  }
}

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveClient {
  void setIntroValue() async {
    await _getStarted();
    var box = await Hive.openBox('Was intro screen show?');
    await box.put('bool', true);
    await _getFinish();
  }

  Future<bool?> getIntroValue() async {
    try {
      await _getStarted();
      var box = await Hive.openBox('Was intro screen show?');
      var result = await box.get('bool') as bool;
      await _getFinish();
      return result;
    } catch (_) {
      debugPrint(_.toString());
      return false;
    }
  }

  _getFinish() async {
    return await Hive.close();
  }

  _getStarted() async {
    return await Hive.initFlutter();
  }
}

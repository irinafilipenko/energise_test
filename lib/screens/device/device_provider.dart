import 'package:energise_test/api/api_service.dart';
import 'package:energise_test/screens/device/device_model.dart';

class DeviceProvider {
  static Future<DeviceModel> getData() async {
    return DeviceModel.fromJson(await ApiService.getRequest());
  }
}

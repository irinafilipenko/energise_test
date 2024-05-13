import 'package:get/get.dart';
import 'package:energise_test/screens/device/device_model.dart';
import 'package:energise_test/screens/device/device_provider.dart';
import 'package:energise_test/services/get_storage_service.dart';

class DeviceController extends GetxController {
  GetStorageService getStorageService = Get.find();
  RxBool isLoading = true.obs;

  Rx<DeviceModel> data = DeviceModel(
          status: '',
          country: '',
          countryCode: '',
          region: '',
          regionName: '',
          city: '',
          zip: '',
          lat: 49.8596,
          lon: 18.8923,
          timezone: '',
          isp: '',
          org: '',
          as: '',
          query: '')
      .obs;

  @override
  onInit() async {
    super.onInit();
    getData();
  }

  Future getData() async {
    isLoading.value = true;
    try {
      await DeviceProvider.getData().then((result) async {
        await Future.delayed(const Duration(milliseconds: 500));
        data.value = result;
        if (data.value.status == "success") {
          isLoading.value = false;
          getStorageService.dataCash.value = data.value;
          getStorageService.dataSave();
        } else {
          data.value = getStorageService.dataCash.value;
          isLoading.value = false;
        }
      });
    } catch (e) {
      data.value = getStorageService.dataCash.value;
      isLoading.value = false;
    }
    data.refresh();
  }
}

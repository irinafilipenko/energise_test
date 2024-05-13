import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:energise_test/components/animated_text.dart';
import 'package:energise_test/components/custom_button.dart';
import 'package:energise_test/screens/device/device_controller.dart';

class DeviceBody extends GetView<DeviceController> {
  const DeviceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: RefreshIndicator(
                onRefresh: controller.getData,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: FlutterMap(
                        options: const MapOptions(
                          initialCenter: LatLng(49.8596, 18.8923),
                          initialZoom: 6,
                          minZoom: 3,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                          const MarkerLayer(
                            markers: [
                              Marker(
                                point: LatLng(49.8596, 18.8923),
                                child: Icon(
                                  Icons.pin_drop,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    animatedText(
                        "${"country:".tr}${controller.data.value.country}",
                        Colors.red),
                    animatedText(
                        "${"countryCode:".tr} ${controller.data.value.countryCode}",
                        Colors.green),
                    animatedText(
                        "${"region:".tr} ${controller.data.value.region}",
                        Colors.blue),
                    animatedText(
                        "${"regionName:".tr} ${controller.data.value.regionName}",
                        Colors.orange),
                    animatedText("${"city:".tr}  ${controller.data.value.city}",
                        Colors.purple),
                    animatedText(
                        "zip: ${controller.data.value.zip}", Colors.yellow),
                    animatedText(
                        "lat: ${controller.data.value.lat}", Colors.cyan),
                    animatedText(
                        "lon: ${controller.data.value.lon}", Colors.deepOrange),
                    animatedText(
                        "${"timezone:".tr} ${controller.data.value.timezone}",
                        Colors.indigo),
                    animatedText(
                        "isp: ${controller.data.value.isp}", Colors.lightGreen),
                    animatedText(
                        "org: ${controller.data.value.org}", Colors.pink),
                    animatedText(
                        "as: ${controller.data.value.as}", Colors.deepPurple),
                    animatedText(
                        "${"query:".tr} ${controller.data.value.query}",
                        Colors.teal),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: CustomButton(
                        label: "Reload".tr,
                        onPressed: controller.getData,
                      ),
                    )
                  ],
                ),
              ),
            );
    }));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';

import '../../controller/lake/lake_near_controller.dart';

class LakeNearMePage extends StatefulWidget {
  LakeNearMePage({Key? key}) : super(key: key);

  @override
  State<LakeNearMePage> createState() => _LakeNearMePageState();
}

class _LakeNearMePageState extends State<LakeNearMePage> {
  final controller = Get.put(LakeNearMeController());
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(
        () => Stack(alignment: Alignment.bottomCenter, children: [
          GoogleMap(
            mapType: MapType.terrain,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: controller.currentLocation.value,
              zoom: 15,
            ),
            padding: EdgeInsets.only(bottom: kH * 0.5),
            myLocationButtonEnabled: true,
            markers: controller.marker.values.toSet(),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Container(
            height: kH * 0.5,
            width: kW,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: kW * 0.1,
                      child: Divider(
                        height: 20,
                        thickness: 5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  CustomText(
                    text: 'Hồ gần đây',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            final GoogleMapController controller =
                                await _controller.future;
                            controller.moveCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                              target: LatLng(10.839195, 106.65361),
                              zoom: 16,
                            )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: boxShadow,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'Hồ câu Quang trung',
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            text:
                                                '123 Quang Trung, Phường 11, Quận Gò Vấp, Thành Phố Hồ Chí Minh',
                                            fontSize: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.my_location,
                                      color: pColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 15,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: kW * 0.05, right: kW * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/lakeChild');
                },
                child: CustomText(
                  text: 'Đặt lịch',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}

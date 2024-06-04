import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../../widget/custom_marker.dart';

class LakeNearMeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LakeNearMeController());
  }
}

class LakeNearMeController extends GetxController {
  final Map<String, Marker> marker = RxMap();
  var currentLocation = LatLng(10.839195, 106.64861).obs;
  final List<Map<String, dynamic>> data = [
    {
      'id': '1',
      'position': const LatLng(10.836195, 106.64861),
    },
    {
      'id': '2',
      'position': const LatLng(10.831195, 106.64861),
    },
    {
      'id': '3',
      'position': const LatLng(10.839195, 106.65361),
    }
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMarker();
  }

  void getMarker() async {
    for (var i = 0; i < data.length; i++) {
      final myIcon = await const CustomMarker().toBitmapDescriptor(
          logicalSize: const Size(100, 100), imageSize: const Size(100, 100));
      marker[i.toString()] = Marker(
        markerId: MarkerId(data[i]['id'].toString()),
        position: data[i]['position'],
        icon: myIcon,
      );
    }
  }
}

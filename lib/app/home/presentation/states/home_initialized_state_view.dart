import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_project_clean_architecture/app/home/domain/entity/region_entity.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/home_controller.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/widgets/show_pollution_index_widget.dart';
import 'package:google_maps_project_clean_architecture/utils/keys.dart';

class HomeInitializedStateView extends StatefulWidget {
  final HomeController controller;
  final List<RegionEntity> regionEntityList;
  const HomeInitializedStateView(
      {Key? key, required this.controller, required this.regionEntityList})
      : super(key: key);

  @override
  State<HomeInitializedStateView> createState() =>
      _HomeInitializedStateViewState();
}

class _HomeInitializedStateViewState extends State<HomeInitializedStateView> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  Set<Marker> getMakerSet({required List<RegionEntity> regionEntityList}) {
    List<Marker> markerList = [];

    for (int i = 0; i < regionEntityList.length; i++) {
      markerList.add(
        Marker(
            markerId: MarkerId(regionEntityList[i].name),
            position: regionEntityList[i].latLng,
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                  ShowPollutionIndexWidget(
                    pollutionIndicesEntity:
                        regionEntityList[i].pollutionIndicesEntity,
                  ),
                  regionEntityList[i].latLng);
            }),
      );
    }

    return markerList.toSet();
  }

  CameraPosition getInitialCameraPosition(
      {required List<RegionEntity> regionEntityList}) {
    CameraPosition cameraPosition = const CameraPosition(
      target: LatLng(0, 0),
      zoom: 0,
    );

    for (int i = 0; i < regionEntityList.length; i++) {
      if (regionEntityList[i].name == Keys.keyNameCentral) {
        cameraPosition = CameraPosition(
          target: regionEntityList[i].latLng,
          zoom: 11,
        );
      }
    }

    return cameraPosition;
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Maps Project')),
      body: Stack(
        children: [
          GoogleMap(
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            mapType: MapType.hybrid,
            markers: getMakerSet(regionEntityList: widget.regionEntityList),
            initialCameraPosition: getInitialCameraPosition(
                regionEntityList: widget.regionEntityList),
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 150,
            offset: 50,
          ),
        ],
      ),
    );
  }
}

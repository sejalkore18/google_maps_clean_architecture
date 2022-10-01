import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_project_clean_architecture/app/home/domain/entity/pollution_indices_entity.dart';
import 'package:google_maps_project_clean_architecture/utils/keys.dart';

class RegionEntity {
  final String name;
  final LatLng latLng;
  final PollutionIndicesEntity pollutionIndicesEntity;

  RegionEntity({
    required this.name,
    required this.latLng,
    required this.pollutionIndicesEntity,
  });

  static convertToEntityFromMap(
      {required Map<String, dynamic> regionData,
      required Map<String, dynamic> readingsData}) {
    return RegionEntity(
      name: regionData[Keys.keyNameName],
      latLng: LatLng(
          double.parse(regionData[Keys.keyNameLabelLocation]
                  [Keys.keyNameLatitude]
              .toString()),
          double.parse(
            regionData[Keys.keyNameLabelLocation][Keys.keyNameLongitude]
                .toString(),
          )),
      pollutionIndicesEntity: PollutionIndicesEntity.convertToEntityFromMap(
        readingsData: readingsData,
        regionName: regionData[Keys.keyNameName],
      ),
    );
  }
}

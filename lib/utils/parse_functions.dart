//converts the response to a list of region entity
import 'package:google_maps_project_clean_architecture/app/home/domain/entity/region_entity.dart';
import 'package:google_maps_project_clean_architecture/utils/keys.dart';

List<RegionEntity> parseToRegionData({required Map<String, dynamic> response}) {
  List<RegionEntity> regionData = [];

  for (int i = 0; i < 6; i++) {
    regionData.add(RegionEntity.convertToEntityFromMap(
        regionData: response[Keys.keyNameRegionMetadata][i],
        readingsData: response[Keys.keyNameItems][0][Keys.keyNameReadings]));
  }

  return regionData;
}

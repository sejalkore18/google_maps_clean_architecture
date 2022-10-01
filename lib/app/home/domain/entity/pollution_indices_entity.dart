// ignore_for_file: non_constant_identifier_names

import 'package:google_maps_project_clean_architecture/utils/keys.dart';

class PollutionIndicesEntity {
  final int O3SubIndex;
  final int COSubIndex;
  final int SO2SubIndex;
  final int PM25SubIndex;
  final int PM10SubIndex;
  final int PM10TwentyFourHourly;
  final int PM25TwentyFourHourly;
  final int SO2TwentyFourHourly;
  final int PSITwentyFourHourly;
  final num COEightHourMax;
  final int O3EightHourMax;
  final int NO2OneHourMax;

  PollutionIndicesEntity({
    required this.O3SubIndex,
    required this.COSubIndex,
    required this.SO2SubIndex,
    required this.PM25SubIndex,
    required this.PM10SubIndex,
    required this.PM10TwentyFourHourly,
    required this.PM25TwentyFourHourly,
    required this.SO2TwentyFourHourly,
    required this.PSITwentyFourHourly,
    required this.COEightHourMax,
    required this.O3EightHourMax,
    required this.NO2OneHourMax,
  });

  static convertToEntityFromMap(
      {required Map<String, dynamic> readingsData,
      required String regionName}) {
    return PollutionIndicesEntity(
      O3SubIndex: readingsData[Keys.keyNameO3SubIndex][regionName],
      COSubIndex: readingsData[Keys.keyNameCOSubIndex][regionName],
      SO2SubIndex: readingsData[Keys.keyNameSO2SubIndex][regionName],
      PM25SubIndex: readingsData[Keys.keyNamePM25SubIndex][regionName],
      PM10SubIndex: readingsData[Keys.keyNamePM10SubIndex][regionName],
      PM10TwentyFourHourly: readingsData[Keys.keyNamePM10TwentyFourHourly]
          [regionName],
      PM25TwentyFourHourly: readingsData[Keys.keyNamePM25TwentyFourHourly]
          [regionName],
      SO2TwentyFourHourly: readingsData[Keys.keyNameSO2TwentyFourHourly]
          [regionName],
      PSITwentyFourHourly: readingsData[Keys.keyNamePSITwentyFourHourly]
          [regionName],
      COEightHourMax: readingsData[Keys.keyNameCOEightHourMax][regionName],
      O3EightHourMax: readingsData[Keys.keyNameO3EightHourMax][regionName],
      NO2OneHourMax: readingsData[Keys.keyNameNO2OneHourMax][regionName],
    );
  }
}

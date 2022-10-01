import 'package:flutter/material.dart';
import 'package:google_maps_project_clean_architecture/app/home/domain/entity/pollution_indices_entity.dart';

//Custom Info Widget that shows the pollution details for every marker.
class ShowPollutionIndexWidget extends StatelessWidget {
  final PollutionIndicesEntity pollutionIndicesEntity;
  const ShowPollutionIndexWidget(
      {Key? key, required this.pollutionIndicesEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("O3 Sub Index :${pollutionIndicesEntity.O3SubIndex}"),
            Text("CO Sub Index :${pollutionIndicesEntity.COSubIndex}"),
            Text("SO2 Sub Index :${pollutionIndicesEntity.SO2SubIndex}"),
            Text("PM25 Sub Index :${pollutionIndicesEntity.PM25SubIndex}"),
            Text("PM10 Sub Index :${pollutionIndicesEntity.PM10SubIndex}"),
            Text(
                "PM10 24-Hourly :${pollutionIndicesEntity.PM10TwentyFourHourly}"),
            Text(
                "PM25 24-Hourly :${pollutionIndicesEntity.PM25TwentyFourHourly}"),
            Text(
                "SO2 24-Hourly :${pollutionIndicesEntity.SO2TwentyFourHourly}"),
            Text(
                "PSI 24-Hourly :${pollutionIndicesEntity.PSITwentyFourHourly}"),
            Text("CO 8-Hour :${pollutionIndicesEntity.COEightHourMax}"),
            Text("O3 8-Hour :${pollutionIndicesEntity.O3EightHourMax}"),
            Text("NO2 1-Hour :${pollutionIndicesEntity.NO2OneHourMax}"),
          ],
        ),
      ),
    );
  }
}

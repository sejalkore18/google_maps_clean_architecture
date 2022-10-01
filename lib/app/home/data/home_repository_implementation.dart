import 'package:google_maps_project_clean_architecture/app/home/domain/entity/region_entity.dart';
import 'package:google_maps_project_clean_architecture/app/home/domain/repository/home_repository.dart';
import 'package:google_maps_project_clean_architecture/utils/parse_functions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer';

class HomeRepositoryImplementation extends HomeRepository {
  @override
  Future<List<RegionEntity>> getData() async {
    Map<String, dynamic> jsonResponse = {};
    List<RegionEntity> regionData = [];
    var response =
        await http.get(Uri.parse('https://api.data.gov.sg/v1/environment/psi'));

    if (response.statusCode == 200) {
      jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      regionData = parseToRegionData(response: jsonResponse);
    } else {
      log('Request failed with status: ${response.statusCode}.');
      throw 'Something Went Wrong';
    }
    return regionData;
  }
}

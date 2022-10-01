import 'package:google_maps_project_clean_architecture/app/home/domain/entity/region_entity.dart';

abstract class HomeRepository {
  Future<List<RegionEntity>> getData();
}

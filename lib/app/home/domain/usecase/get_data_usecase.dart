import 'dart:async';
import 'dart:developer';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:google_maps_project_clean_architecture/app/home/domain/entity/region_entity.dart';
import 'package:google_maps_project_clean_architecture/app/home/domain/repository/home_repository.dart';

class GetDataUsecase extends CompletableUseCase<void> {
  final HomeRepository _repository;
  GetDataUsecase(this._repository);

  @override
  Future<Stream<List<RegionEntity>>> buildUseCaseStream(params) async {
    final StreamController<List<RegionEntity>> streamController =
        StreamController();
    try {
      final List<RegionEntity> regionEntityList = await _repository.getData();
      streamController.add(regionEntityList);
    } catch (error) {
      log('Error in getting home data : $error :  GetDataUsecase ');

      streamController.addError(error);
    }
    streamController.close();
    return streamController.stream;
  }
}

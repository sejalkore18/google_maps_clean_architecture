import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:google_maps_project_clean_architecture/app/home/domain/usecase/get_data_usecase.dart';
import 'package:google_maps_project_clean_architecture/core/observer.dart';

class HomePresenter extends Presenter {
  final GetDataUsecase getDataUsecase;
  HomePresenter(this.getDataUsecase);

  @override
  dispose() {
    getDataUsecase.dispose();
  }

  void getData({required UseCaseObserver observer}) {
    getDataUsecase.execute(observer);
  }
}

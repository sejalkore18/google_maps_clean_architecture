import 'dart:developer';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get/get.dart';
import 'package:google_maps_project_clean_architecture/app/home/domain/entity/region_entity.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/home_presenter.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/home_state_machine.dart';
import 'package:google_maps_project_clean_architecture/core/observer.dart';
import 'package:google_maps_project_clean_architecture/core/services/navigation_service.dart';

class HomeController extends Controller {
  final HomePresenter presenter;
  final HomeStateMachine stateMachine;
  final NavigationService navigationService;
  HomeController()
      : presenter = Get.find<HomePresenter>(),
        stateMachine = HomeStateMachine(),
        navigationService = Get.find<NavigationService>(),
        super();

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }

  HomeState getCurrentState() {
    return stateMachine.getCurrentState();
  }

  void getData() {
    presenter.getData(
      observer: UseCaseObserver(() {}, (error) {
        log('Error in getting data: $error : HomeController');
      }, onNextFunc: (List<RegionEntity> regionEntityList) {
        stateMachine
            .onEvent(HomeInitializedEvent(regionEntityList: regionEntityList));
        refreshUI();
      }),
    );
  }
}

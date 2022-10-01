import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/home_controller.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/home_state_machine.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/states/error_state_view.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/states/home_initialization_state_view.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/states/home_initialized_state_view.dart';

class HomeView extends View {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends ResponsiveViewState<HomeView, HomeController> {
  HomeViewState() : super(HomeController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder(
        builder: (BuildContext context, HomeController controller) {
      final HomeState currentState = controller.getCurrentState();
      final currentStateType = currentState.runtimeType;
      switch (currentStateType) {
        case HomeInitializationState:
          return HomeInitializationStateView(controller: controller);

        case HomeInitializedState:
          HomeInitializedState homeInitializedState =
              currentState as HomeInitializedState;
          return HomeInitializedStateView(
            controller: controller,
            regionEntityList: homeInitializedState.regionEntityList,
          );

        case ErrorState:
          return const ErrorStateView();
        default:
          throw Exception(
              "Build mobileView was called on invalid state : $currentStateType : HomeView");
      }
    });
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}

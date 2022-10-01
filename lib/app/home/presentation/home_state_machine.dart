import 'package:google_maps_project_clean_architecture/app/home/domain/entity/region_entity.dart';
import 'package:google_maps_project_clean_architecture/core/state_machine.dart';

class HomeStateMachine extends StateMachine<HomeState, HomeEvent> {
  HomeStateMachine() : super(HomeInitializationState());

  @override
  HomeState getStateOnEvent(HomeEvent event) {
    final eventType = event.runtimeType;
    HomeState newState = getCurrentState();
    switch (eventType) {
      case HomeInitializedEvent:
        HomeInitializedEvent homeInitializedEvent =
            event as HomeInitializedEvent;
        newState = HomeInitializedState(
            regionEntityList: homeInitializedEvent.regionEntityList);
        break;

      case ErrorEvent:
        newState = ErrorState();
        break;

      default:
        throw Exception("Invalid Event $eventType : HomeStateMachine");
    }
    return newState;
  }
}

class HomeState {}

class HomeInitializationState extends HomeState {}

class HomeInitializedState extends HomeState {
  final List<RegionEntity> regionEntityList;

  HomeInitializedState({required this.regionEntityList});
}

class ErrorState extends HomeState {}

class HomeEvent {}

class HomeInitializedEvent extends HomeEvent {
  final List<RegionEntity> regionEntityList;

  HomeInitializedEvent({required this.regionEntityList});
}

class ErrorEvent extends HomeEvent {}

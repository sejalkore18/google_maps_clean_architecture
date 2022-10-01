import 'package:get/get.dart';
import 'package:google_maps_project_clean_architecture/app/home/data/home_repository_implementation.dart';
import 'package:google_maps_project_clean_architecture/app/home/domain/repository/home_repository.dart';
import 'package:google_maps_project_clean_architecture/app/home/domain/usecase/get_data_usecase.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/home_presenter.dart';
import 'package:google_maps_project_clean_architecture/core/services/navigation_service.dart';

Future<void> init() async {
//Services
  Get.put(NavigationService(), permanent: true);

//Repositories
  Get.lazyPut<HomeRepository>(() => HomeRepositoryImplementation());

//Usecases
  Get.put(GetDataUsecase(Get.find()));

//Presenter
  Get.put(HomePresenter(Get.find()));
}

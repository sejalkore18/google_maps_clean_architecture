import 'package:get/get.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/home_view.dart';

class NavigationService {
  static const String homeRoute = "/home";

  final List<GetPage<dynamic>> getPages = [
    GetPage(name: homeRoute, page: () => const HomeView()),
  ];

  Future<dynamic> navigateTo(String routeName,
      {bool shouldReplace = false, Object? arguments}) async {
    if (shouldReplace) {
      return Get.offNamed(routeName, arguments: arguments);
    }
    return Get.toNamed(routeName, arguments: arguments);
  }

  void navigateBack({Object? data}) {
    return Get.back(result: data);
  }

  Future<void> popUntil(String untilRoute) async {
    return Get.offNamedUntil(untilRoute, (route) => false);
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_project_clean_architecture/app/home/presentation/home_controller.dart';

class HomeInitializationStateView extends StatelessWidget {
  final HomeController controller;
  const HomeInitializationStateView({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getData();
    return Scaffold(
      appBar: AppBar(title: const Text('Google Maps Project')),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

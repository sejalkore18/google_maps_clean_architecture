import 'package:flutter/material.dart';

class ErrorStateView extends StatelessWidget {
  const ErrorStateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Maps Project')),
      body: const Center(
        child: Text('Error Occured :('),
      ),
    );
  }
}

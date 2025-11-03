import 'package:flutter/material.dart';

/// HomeScreen is the main landing screen for FocusFlow.
///
/// Use this as an entry point to navigate to features and
/// connect to BLoCs and repositories.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FocusFlow')),
      body: const Center(child: Text('Welcome to FocusFlow')),
    );
  }
}



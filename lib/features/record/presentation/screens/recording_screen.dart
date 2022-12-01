library recording_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// A stateful widget that renders RecordingScreen.
class RecordingScreen extends StatefulWidget with AutoRouteWrapper {
  const RecordingScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  RecordingScreenState createState() => RecordingScreenState();
}

class RecordingScreenState extends State<RecordingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Screen Template for RecordingScreen'),
      ),
    );
  }
}

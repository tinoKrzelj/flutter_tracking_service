import 'package:flutter/material.dart';
import 'package:tracking_service/tracking_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TrackingService trackingService = TrackingServiceFactory.create();

  void _testSendEvent() {
    final event = TrackingEvent(
      name: "Test Event",
      attributes: {"arg1": "val1"},
      platforms: [TrackingPlatform.firebase],
    );
    trackingService.trackEvent(event);
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                _testSendEvent();
              },
              child: const Text("Send Test Event")),
        ),
      ),
    );
  }
}

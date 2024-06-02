import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tracking_service/tracking_service.dart';

import 'firebase_options.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TrackingService trackingService = TrackingServiceFactory.create();

  void _testSendEvent() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final event = TrackingEvent(
      name: "test_event",
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
              onPressed: () async {
                _testSendEvent();
              },
              child: const Text("Send Test Event")),
        ),
      ),
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_service/src/data/data_source/plugin/tracking_service_firebase_data_source.dart';
import 'package:tracking_service/src/data/tracking_service_impl.dart';
import 'package:tracking_service/tracking_service.dart';

main() {
  late TrackingServiceImpl trackingServiceImpl;
  late TrackingServiceFirebaseDataSource trackingServiceFirebaseDataSource;

  setUp(() {
    trackingServiceFirebaseDataSource = MockTrackingServiceFirebaseDataSource();
    trackingServiceImpl = TrackingServiceImpl(
        firebaseDataSource: trackingServiceFirebaseDataSource);
  });

  test("Test trackEvent (with default platform)", () async {
    final testEvent = TrackingEvent(
      name: "Test Event",
      attributes: {"att1": "val1"},
    );

    when(() => trackingServiceFirebaseDataSource.trackEvent(testEvent))
        .thenAnswer((invocation) => Future(() => null));

    await trackingServiceImpl.trackEvent(testEvent);

    verify(() => trackingServiceFirebaseDataSource.trackEvent(testEvent))
        .called(1);
  });

  test("Test trackEvent (with explicit firebase platform)", () async {
    final testEvent = TrackingEvent(
        name: "Test Event",
        attributes: {"att1": "val1"},
        platforms: [TrackingPlatform.firebase]);

    when(() => trackingServiceFirebaseDataSource.trackEvent(testEvent))
        .thenAnswer((invocation) => Future(() => null));

    await trackingServiceImpl.trackEvent(testEvent);

    verify(() => trackingServiceFirebaseDataSource.trackEvent(testEvent))
        .called(1);
  });

  test("Test trackEvent (with explicit no platform)", () async {
    final testEvent = TrackingEvent(
        name: "Test Event", attributes: {"att1": "val1"}, platforms: []);

    when(() => trackingServiceFirebaseDataSource.trackEvent(testEvent))
        .thenAnswer((invocation) => Future(() => null));

    await trackingServiceImpl.trackEvent(testEvent);

    verifyNever(() => trackingServiceFirebaseDataSource.trackEvent(testEvent));
  });
}

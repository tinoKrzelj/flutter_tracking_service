import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_service/tracking_service.dart';

main() {
  test("Test TrackingService create()", () {
    TrackingService trackingService = TrackingServiceFactory.create();
    expect(trackingService, isA<TrackingService>());
  });

  test("Test TrackingService createForTesting()", () {
    MockTrackingServiceFirebaseDataSource mockFirebaseDataSource =
        MockTrackingServiceFirebaseDataSource();
    TrackingService trackingService = TrackingServiceFactory.createForTesting(
        mockFirebaseDataSource: mockFirebaseDataSource);
    expect(trackingService, isA<TrackingService>());
  });
}

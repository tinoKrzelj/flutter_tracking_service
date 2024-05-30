import 'package:tracking_service/src/data/data_source/plugin/tracking_service_firebase_data_source.dart';
import 'package:tracking_service/src/data/tracking_service_impl.dart';
import 'package:tracking_service/src/domain/mocks/tracking_service_mocks.dart';
import 'package:tracking_service/src/domain/tracking_service.dart';

class TrackingServiceFactory {
  static TrackingService create() {
    return TrackingServiceImpl(
      firebaseDataSource: TrackingServiceFirebaseDataSource(),
    );
  }

  /// IMPORTANT: Use this factory only for tests/testing in order to provide injectable mock data sources.
  static TrackingService createForTesting(
      {required MockTrackingServiceFirebaseDataSource mockFirebaseDataSource}) {
    return TrackingServiceImpl(
      firebaseDataSource: mockFirebaseDataSource,
    );
  }
}

import 'package:tracking_service/src/data/data_source/plugin/tracking_service_firebase_data_source.dart';
import 'package:tracking_service/src/data/tracking_service_impl.dart';
import 'package:tracking_service/src/domain/tracking_service.dart';

class TrackingServiceFactory {
  static TrackingService create() {
    return TrackingServiceImpl(
      firebaseDataSource: TrackingServiceFirebaseDataSource(),
    );
  }

  /// Used only for tests in order to provide injectable mock data sources.
  static TrackingService createForTesting(
      {required TrackingServiceFirebaseDataSource mockFirebaseDataSource}) {
    return TrackingServiceImpl(
      firebaseDataSource: mockFirebaseDataSource,
    );
  }
}

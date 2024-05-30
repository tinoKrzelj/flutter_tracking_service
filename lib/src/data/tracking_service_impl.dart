import 'package:tracking_service/src/data/data_source/plugin/tracking_service_firebase_data_source.dart';
import 'package:tracking_service/src/domain/entity/tracking_service_event.dart';
import 'package:tracking_service/src/domain/entity/tracking_service_platform.dart';
import 'package:tracking_service/src/domain/tracking_service.dart';

class TrackingServiceImpl extends TrackingService {
  // MARK: - Properties
  late TrackingServiceFirebaseDataSource _firebaseDataSource;

  // MARK: - Initializers
  TrackingServiceImpl({
    required TrackingServiceFirebaseDataSource firebaseDataSource,
  }) {
    _firebaseDataSource = firebaseDataSource;
  }

  // MARK: - TrackingService Overrides
  @override
  Future<void> trackEvent(TrackingEvent event) async {
    if (event.platforms.contains(TrackingPlatform.firebase)) {
      await _firebaseDataSource.trackEvent(event);
    }
  }
}

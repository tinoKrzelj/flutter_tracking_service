import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:logger/logger.dart';
import 'package:tracking_service/src/data/data_source/tracking_service_data_source.dart';
import 'package:tracking_service/src/domain/entity/tracking_service_event.dart';

class TrackingServiceFirebaseDataSource extends TrackingServiceDataSource {
  // MARK: - Properties
  final Logger _logger;
  // final FirebaseAnalytics _firebaseAnalytics;

  // MARK: - Initializers
  TrackingServiceFirebaseDataSource() : _logger = Logger();

  // MARK: - TrackingServiceDataSource Overrides
  @override
  Future<void> trackEvent(TrackingEvent event) {
    _logger.d(
        "TrackingService -> TrackingServiceFirebaseDataSource -> Event with name ${event.name} sent.");

    return FirebaseAnalytics.instance.logEvent(
      name: event.name,
      parameters: event.attributes,
    );
  }
}

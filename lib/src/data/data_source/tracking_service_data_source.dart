import 'package:tracking_service/src/domain/entity/tracking_service_event.dart';

abstract class TrackingServiceDataSource {
  Future<void> trackEvent(TrackingEvent event);
}

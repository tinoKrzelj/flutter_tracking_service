import 'package:tracking_service/src/domain/entity/tracking_service_platform.dart';

class TrackingEvent {
  String name;
  Map<String, String> attributes;

  List<TrackingPlatform> platforms;

  TrackingEvent(
      {required this.name,
      required this.attributes,
      this.platforms = const [TrackingPlatform.firebase]});
}

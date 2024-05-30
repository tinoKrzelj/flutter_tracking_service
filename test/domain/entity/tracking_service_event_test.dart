import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_service/tracking_service.dart';

main() {
  test("Test Event Initialization (with explicit platform)", () {
    final event = TrackingEvent(
      name: "Test Event",
      attributes: {"arg1": "val1"},
      platforms: [TrackingPlatform.firebase],
    );

    expect(event.name, "Test Event");
    expect(event.attributes.length, 1);
    expect(event.attributes["arg1"], "val1");
    expect(event.platforms.length, 1);
    expect(event.platforms.first, TrackingPlatform.firebase);
  });

  test("Test Event Initialization (without explicit platform)", () {
    final event = TrackingEvent(
      name: "Test Event",
      attributes: {"arg1": "val1"},
    );

    expect(event.name, "Test Event");
    expect(event.attributes.length, 1);
    expect(event.attributes["arg1"], "val1");
    expect(event.platforms.length, 1);
    expect(event.platforms.first, TrackingPlatform.firebase);
  });
}

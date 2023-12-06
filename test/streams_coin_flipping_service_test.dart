import 'package:streams_coin_flipping_service/streams_coin_flipping_service.dart';
import 'package:test/test.dart';

void main() {
  group('Coin Flipping Service Tests', () {
    late CoinFlippingService coinFlipper;

    setUp(() {
      coinFlipper = CoinFlippingService();
    });

    test('Generates 10 random coin flips', () async {
      var flips = await coinFlipper.onFlip.take(10).toList();
      expect(flips.length, equals(10));
      for (var flip in flips) {
        expect(['Heads', 'Tails'].contains(flip), isTrue);
      }
    });

    test('Emits coin flips at 500ms intervals', () async {
      var stopwatch = Stopwatch()..start();
      await for (var _ in coinFlipper.onFlip.take(10)) {}
      stopwatch.stop();
      expect(stopwatch.elapsed,
          greaterThanOrEqualTo(Duration(milliseconds: 5000)));
    });
  });
}

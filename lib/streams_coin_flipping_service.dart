/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

export 'src/streams_coin_flipping_service_base.dart';

/*
Practice Question 2: Coin Flipping Service

Task:

Create a CoinFlippingService that generates a stream of 10 random coin flips ('Heads' or 'Tails'), 
each separated by a 500-millisecond delay.
 */

class CoinFlippingService {
  Stream<String> get onFlip => _coinFlipper();

  Stream<String> _coinFlipper() async* {
    int counter = 0;
    while (true) {
      await Future<void>.delayed(Duration(milliseconds: 500));
      if (counter.isEven) {
        yield 'Heads';
      } else {
        yield 'Tails';
      }
      counter++;
    }
  }
}

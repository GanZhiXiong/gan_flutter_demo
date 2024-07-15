import 'package:flutter_test/flutter_test.dart';

abstract interface class Tuner {
  void tuneInstrument();
}

mixin Guitarist implements Tuner {
  void playSong() {
    tuneInstrument();

    print('Strums guitar majestically.');
  }
}

class PunkRocker with Guitarist {
  void tuneInstrument() {
    print("Don't bother, being out of tune is punk rock.");
  }
}

void main() {

  void tuneInstrument(Tuner tuner) {
    tuner.tuneInstrument();
  }

  test('mixins test', () {
    var p = PunkRocker();
    p.tuneInstrument();
    tuneInstrument(p);
  });
}

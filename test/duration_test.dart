
import 'package:flutter_test/flutter_test.dart';

extension RestTimeOnDuration on Duration {
  int get inDaysRest => inDays;
  int get inHoursRest => inHours - (inDays * 24);
  int get inMinutesRest => inMinutes - (inHours * 60);
  int get inSecondsRest => inSeconds - (inMinutes * 60);
  int get inMillisecondsRest => inMilliseconds - (inSeconds * 1000);
  int get inMicrosecondsRest => inMicroseconds - (inMilliseconds * 1000);
}

void main() {
  String _printDuration(Duration duration) {
    String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$negativeSign${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }


  test('duration to datetime', () {
    const a = Duration(hours: 1, minutes: 2, seconds: 3);
    print(_printDuration(a));
    print(a.inHoursRest);
    print(a.inMinutesRest);
    print(a.inSecondsRest);

    const b = Duration(hours: 10, minutes: 59, seconds: 60);
    print(_printDuration(b));
    print(b.inHoursRest);
    print(b.inMinutesRest);
    print(b.inSecondsRest);

    const c = Duration(hours: 10, minutes: 59, seconds: 59);
    print(_printDuration(c));
    print(c.inHoursRest);
    print(c.inMinutesRest);
    print(c.inSecondsRest);

  });
}
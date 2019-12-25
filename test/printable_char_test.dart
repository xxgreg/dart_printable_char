import 'dart:io';
import 'package:printable_char/printable_char.dart';
import 'package:test/test.dart';

void main() {
  test('Basic chars', () {
    expect(isPrintable('a'.runes.first), isTrue);
    expect(isPrintable('💩'.runes.first), isTrue);
    expect(isPrintable('\n'.runes.first), isFalse);
  });

  test('All of the chars', () {
    var file = File.fromUri(Uri(path: 'test/is_print.txt')).openSync();

    int t = 't'.codeUnitAt(0);
    int f = 'f'.codeUnitAt(0);
    int newline = '\n'.codeUnitAt(0);

    int b;
    int rune = 0;
    while (true) {

      bool goIsPrint;
      b = file.readByteSync();
      if (b == t) {
        goIsPrint = true;
      } else if (b == f) {
        goIsPrint = false;
      } else if (b == -1) {
        break;
      } else {
        throw 'Bad karma.';
      }

      expect(isPrintable(rune), equals(goIsPrint));

      b = file.readByteSync();
      if (b != newline) throw 'Bad karma.';

      rune++;
    }

    // You'll need to periodically increase this number whenever go updates
    // unicode support to a new unicode version.
    expect(rune, equals(1114112));

    file.closeSync();
  });
}

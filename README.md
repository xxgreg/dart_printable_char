# printable_char

Test if a character code represents a printable character.

## Usage

Add the dependency to your pubspec.yaml.

This library isn't published on pub. If you have time to maintain it, feel free
 to publish it yourself and to maintain it.

```yaml
dependencies:
  printable_char:
    git: git://github.com/xxgreg/dart_printable_char.git
```

Then import the library and use it.

```dart
import 'package:printable_char/printable_char.dart';

main() {
  bool x = isPrintable('x'.codeUnitAt(0));
  print(x);
}
```

## Build

If you need to update this library to support the latest unicode version follow 
these instructions. This is not required if you only are only using 
the library. 

* Make sure you have the current stable version of go installed.

* From the project root directory run `./tool/build_tables.sh`.

This will generate dart source containing tables from the go standard libraries unicode tables.

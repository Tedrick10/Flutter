// Flutter: External Libraries
import 'package:test/test.dart';

// Libraries: Existing Files
import '../lib/counter.dart';

void main() {
  // test(
  //   "Counter value should be incremented",
  //   () {
  //     final Counter counter = Counter();
  //     counter.increment();
  //     expect(counter.value, 1);
  //   },
  // );

  group(
    "Counter",
    () {
      test(
        "Value should start at 0.",
        () {
          expect(Counter().value, 0);
        },
      );
      test(
        "Value should be incrmented",
        () {
          final Counter counter = Counter();
          counter.increment();
          expect(counter.value, 1);
        },
      );
      test(
        "Value should be decremented",
        () {
          final Counter counter = Counter();
          counter.decrement();
          expect(counter.value, -1);
        },
      );
    },
  );
}

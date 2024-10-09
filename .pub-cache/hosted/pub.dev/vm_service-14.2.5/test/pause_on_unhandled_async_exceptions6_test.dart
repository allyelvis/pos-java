// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Verifies that debugger does not pause when exception is caught by stream
// onError.
//
// Regression test for https://github.com/dart-lang/sdk/issues/54788.
import 'dart:async';

import 'common/service_test_common.dart';
import 'common/test_helper.dart';

// AUTOGENERATED START
//
// Update these constants by running:
//
// dart runtime/observatory/tests/service/update_line_numbers.dart <test.dart>
//
const int LINE_A = 32;
const int LINE_AA = 36;
const int LINE_AB = 42;
const int LINE_B = 112;
const int LINE_C = 116;
// AUTOGENERATED END

Stream<int> _throwingStream1(String exceptionToThrow) async* {
  for (var i = 0; i < 10; i++) {
    yield i;
  }

  throw exceptionToThrow; // LINE_A
}

Stream<int> _throwingStream2(String exceptionToThrow) async* {
  await for (var e in _throwingStream1(exceptionToThrow)) /* LINE_AA */ {
    yield e;
  }
}

Stream<int> _throwingStream3(String exceptionToThrow) async* {
  yield* _throwingStream1(exceptionToThrow); // LINE_AB
}

final streamFactories = [
  _throwingStream1,
  _throwingStream2,
  _throwingStream3,
];

Future<void> testeeMain({
  bool shouldTestUncaught = true,
}) async {
  int testCaseId = 0;
  for (var makeStream in streamFactories) {
    await testStreamCaught(() => makeStream('Caught#${testCaseId++}'));
  }

  if (shouldTestUncaught) {
    int testCaseId = 0;
    for (var makeStream in streamFactories) {
      await testStreamUncaught(() => makeStream('Uncaught#${testCaseId++}'));
    }
  }
}

Future<void> testStreamCaught(Stream<int> Function() makeStream) async {
  final c = Completer<void>();
  makeStream().listen(
    (_) {},
    onError: (_) {
      // Ignore
    },
    onDone: () {
      c.complete();
    },
  );

  await c.future;

  try {
    await makeStream().toList();
  } catch (_) {}

  try {
    await makeStream().last;
  } catch (_) {}

  try {
    await for (var _ in makeStream()) {}
  } catch (_) {}
}

Future<void> runExpectingUncaughtError(Future<void> Function() test) async {
  final done = Completer();
  Zone.current.fork(
    specification: ZoneSpecification(
      handleUncaughtError: (self, parent, zone, error, stackTrace) {
        done.complete();
      },
    ),
  ).runGuarded(test);
  await done.future;
}

Future<void> testStreamUncaught(Stream<int> Function() makeStream) async {
  await runExpectingUncaughtError(() async {
    makeStream().listen((_) {});
  });

  await runExpectingUncaughtError(() async {
    await makeStream().toList(); // LINE_B
  });

  await runExpectingUncaughtError(() async {
    await makeStream().last; // LINE_C
  });
}

final tests = () {
  int nextTestIndex = 0;

  List<IsolateTest> makeTest(List<ExpectedFrame> expectedFrames) {
    final testIndex = nextTestIndex++;
    return [
      // If this is not the very first test we need to skip the
      // uncaught exception from the previous test first.
      if (testIndex > 0)
        resumePastUnhandledException('Uncaught#${testIndex - 1}'),
      expectUnhandledExceptionWithFrames(
        exceptionAsString: 'Uncaught#$testIndex',
        expectedFrames: expectedFrames,
      ),
    ];
  }

  /// Creates expectations correspondong to test cases in [testStreamUncaught]
  /// given the specific stack prefix characteristic for the specific stream
  /// factory (see [streamFactories]).
  List<IsolateTest> makeTests(List<ExpectedFrame> streamFactoryPrefix) => [
        // Testing: _stream().listen((_) {})
        ...makeTest([
          ...streamFactoryPrefix,
          asyncGap,
          (
            functionName:
                'testStreamUncaught.<anonymous closure>.<anonymous closure>',
            line: null
          ),
        ]),

        // Testing: _stream().toList()
        ...makeTest([
          ...streamFactoryPrefix,
          asyncGap,
          (functionName: 'Stream.toList.<anonymous closure>', line: null),
          asyncGap,
          (
            functionName: 'testStreamUncaught.<anonymous closure>',
            line: LINE_B
          ),
        ]),

        // Testing: _stream().last
        ...makeTest([
          ...streamFactoryPrefix,
          asyncGap,
          (functionName: 'Stream.last.<anonymous closure>', line: null),
          asyncGap,
          (
            functionName: 'testStreamUncaught.<anonymous closure>',
            line: LINE_C
          ),
        ]),
      ];

  return [
    ...makeTests([
      (functionName: '_throwingStream1', line: LINE_A),
    ]),
    ...makeTests([
      (functionName: '_throwingStream1', line: LINE_A),
      asyncGap,
      (functionName: '_throwingStream2', line: LINE_AA),
    ]),
    ...makeTests([
      (functionName: '_throwingStream1', line: LINE_A),
      asyncGap,
      (functionName: '_throwingStream3', line: LINE_AB),
    ]),
  ];
}();

Future<void> main([args = const <String>[]]) => runIsolateTests(
      args,
      tests,
      'pause_on_unhandled_async_exceptions6_test.dart',
      pauseOnUnhandledExceptions: true,
      testeeConcurrent: testeeMain,
    );
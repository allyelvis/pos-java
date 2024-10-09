// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// OtherResources=simple_reload/v1/main.dart simple_reload/v2/main.dart

import 'dart:async';
import 'dart:developer';
import 'dart:io';
// ignore: library_prefixes
import 'dart:isolate' as I;

import 'package:path/path.dart' as path;
import 'package:test/test.dart';
import 'package:vm_service/vm_service.dart';

import 'common/service_test_common.dart';
import 'common/test_helper.dart';

// AUTOGENERATED START
//
// Update these constants by running:
//
// dart pkg/vm_service/test/update_line_numbers.dart <test.dart>
//
const LINE_A = 39;
const LINE_B = 43;
// AUTOGENERATED END

// Chop off the file name.
final baseDirectory = '${path.dirname(Platform.script.path)}/';

final baseUri = Platform.script.replace(path: baseDirectory);
final spawnUri = baseUri.resolveUri(Uri.parse('simple_reload/v1/main.dart'));
final v2Uri = baseUri.resolveUri(Uri.parse('simple_reload/v2/main.dart'));

Future<void> testMain() async {
  print(baseUri);
  debugger(); // LINE_A
  // Spawn the child isolate.
  final I.Isolate isolate = await I.Isolate.spawnUri(spawnUri, [], null);
  print(isolate);
  debugger(); // LINE_B
}

Future<String> invokeTest(VmService service, IsolateRef isolateRef) async {
  final isolateId = isolateRef.id!;
  final isolate = await service.getIsolate(isolateId);
  final result = await service.evaluate(
    isolateId,
    isolate.rootLib!.id!,
    'test()',
  ) as InstanceRef;
  expect(result.kind, InstanceKind.kString);
  return result.valueAsString!;
}

final tests = <IsolateTest>[
  // Stopped at 'debugger' statement.
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_A),
  // Resume the isolate into the while loop.
  resumeIsolate,
  // Stop at 'debugger' statement.
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_B),
  (VmService service, IsolateRef isolateRef) async {
    // Grab the VM.
    final vm = await service.getVM();
    final isolates = vm.isolates!;
    expect(isolates.length, 2);

    // Find the spawned isolate.
    final spawnedIsolate = isolates.firstWhere(
      (i) => i != isolateRef,
    );
    expect(spawnedIsolate, isNotNull);

    // Invoke test in v1.
    final v1 = await invokeTest(service, spawnedIsolate);
    expect(v1, 'apple');

    // Reload to v2.
    await service.reloadSources(
      spawnedIsolate.id!,
      rootLibUri: v2Uri.toString(),
    );

    final v2 = await invokeTest(service, spawnedIsolate);
    expect(v2, 'orange');
  }
];

void main([args = const <String>[]]) => runIsolateTests(
      args,
      tests,
      'simple_reload_test.dart',
      testeeConcurrent: testMain,
    );

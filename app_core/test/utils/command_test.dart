// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:app_core/utils/command.dart';
import 'package:app_core/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../testing/utils/result.dart';

void main() {
  group('Pruebas de Command0: ', () {
    test('Completar el comando void', () async {
      // Void action
      final command = Command0<void>(() => Future.value(Result.ok(null)));

      // Run void action
      await command.execute();

      // Action completed
      expect(command.completed, true);
    });

    test('Completar el comando con resultado bool', () async {
      // Action that returns bool
      final command = Command0<bool>(() => Future.value(Result.ok(true)));

      // Run action with result
      await command.execute();

      // Action completed
      expect(command.completed, true);
      expect(command.result!.asOk.value, true);
    });

    test('la opcion running debe ser true y finalizar el comando', () async {
      final command = Command0<void>(() => Future.value(Result.ok(null)));
      final future = command.execute();

      // Action is running
      expect(command.running, true);

      // Await execution
      await future;

      // Action finished running
      expect(command.running, false);
    });

    test('Solo debe ejecutarse una vez', () async {
      var count = 0;
      final command = Command0<int>(() => Future.value(Result.ok(count++)));
      final future = command.execute();

      // Run multiple times
      command.execute();
      command.execute();
      command.execute();
      command.execute();

      // Await execution
      await future;

      // Action is called once
      expect(count, 1);
    });

    test('Debe manejar los erores', () async {
      final command = Command0<int>(
        () => Future.value(Result.error(Exception('ERROR!'))),
      );
      await command.execute();
      expect(command.error, true);
      expect(command.result, isA<Error>());
    });
  });

  group('Pruebas de Command1: ', () {
    test('Debe completar el comando con un argumento bool', () async {
      // Void action with bool argument
      final command = Command1<void, bool>((a) {
        expect(a, true);
        return Future.value(Result.ok(null));
      });

      // Run void action, ignore void return
      await command.execute(true);

      expect(command.completed, true);
    });

    test('Debe estar el comando con un argumento completado', () async {
      // Action that returns bool argument
      final command = Command1<bool, bool>(
        (a) => Future.value(const Result.ok(true)),
      );

      // Run action with result and argument
      await command.execute(true);

      // Argument was passed to onComplete
      expect(command.completed, true);
      expect(command.result!.asOk.value, true);
    });
  });
}

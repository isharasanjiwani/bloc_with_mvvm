import 'dart:convert';
import 'dart:io';
import 'package:block_practice/src/core/utils/typedef.dart';
import 'package:block_practice/src/features/authentication/data/models/user_model.dart';
import 'package:block_practice/src/features/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  test(
      'should be subclass of [User] entity',
      () {
        expect(tModel, isA<User>());
      }
  );

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });

  group('should return a [UserModel] with the right data', () {
    final result = UserModel.fromJson(tJson);
    expect(result, equals(tModel));
  });
}
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/authentication_repository.dart';

class CreateUser extends UseCaseWithParams<void, CreateUserParams>{
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar
  }) async => _repository.createUser(
      createdAt: createdAt,
      name: name,
      avatar: avatar
  );

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUser(
      createdAt: params.createdAt,
      name: params.name,
      avatar: params.avatar
  );
}

class CreateUserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar
  });

  const CreateUserParams.empty() :
      this(
        createdAt: '_empty.createdAt',
        name: '_empty.name',
        avatar: '_empty.avatar'
      );

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
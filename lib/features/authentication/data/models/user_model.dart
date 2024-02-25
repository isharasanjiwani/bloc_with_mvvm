import 'dart:convert';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/user.dart';

class UserModel extends User{
  const UserModel({
    required super.avatar,
    required super.id,
    required super.name,
    required super.createdAt
  });

  const UserModel.empty() :
      this(
        id: '1',
        avatar: '_empty.avatar',
        name: '_empty.name',
        createdAt: '_empty.createdAt'
      );

  factory UserModel.fromJson(String source) =>
    UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map) :
      this(
        avatar: map['avatar'] as String,
        id: map['id'] as String,
        name: map['name'] as String,
        createdAt: map['createdAt'] as String
      );

  UserModel copyWith({
    String? avatar,
    String? id,
    String? name,
    String? createdAt
  }) {
    return UserModel(
      avatar: avatar ?? this.avatar,
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt
    );
  }

  DataMap toMap() => {
    'id': id,
    'avatar': avatar,
    'name': name,
    'createdAt': createdAt
  };

  String toJson() => jsonEncode(toMap());
}
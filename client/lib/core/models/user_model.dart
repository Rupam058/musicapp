// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:client/features/home/models/fav_song_model.dart';

// class that hold data
class UserModel {
  final String name;
  final String email;
  final String id;
  final String token;
  final List<FavSongModel> favSongs;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.token,
    required this.favSongs,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? id,
    String? token,
    List<FavSongModel>? favSongs,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      token: token ?? this.token,
      favSongs: favSongs ?? this.favSongs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'id': id,
      'token': token,
      'favSongs': favSongs.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      token: map['token'] ?? '',
      favSongs: List<FavSongModel>.from(
        (map['favSongs'] ?? []).map(
          (x) => FavSongModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, id: $id, token: $token, favSongs: $favSongs)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.id == id &&
        other.token == token &&
        listEquals(other.favSongs, favSongs);
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ id.hashCode ^ token.hashCode ^ favSongs.hashCode;
  }
}
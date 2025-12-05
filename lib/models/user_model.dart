// lib/models/user_model.dart
class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;

  UserModel({this.id, this.name, this.email, this.photoUrl});

  factory UserModel.fromMap(Map<String, dynamic> m) => UserModel(
    id: m['id']?.toString(),
    name: m['name'],
    email: m['email'],
    photoUrl: m['photoUrl'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'email': email,
    'photoUrl': photoUrl,
  };
}

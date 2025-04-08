import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String city;
  final String role;
  final Timestamp? createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.city,
    required this.role,
    this.createdAt,
  });

  // Convert ke Map untuk disimpan di Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'city': city,
      'role': role,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }

  // Convert dari Map ke Object UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? "",
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      password: map['password'] ?? "",
      phone: map['phone'] ?? "-",
      city: map['city'] ?? "-",
      role: map['role'] ?? "default",
      createdAt: map['createdAt'] ?? "",
    );
  }
}
import 'package:encrypt/encrypt.dart' as encrypt;

const _key = 'my32lengthsupersecretnooneknows1'; // Panjang harus 32 karakter
const _iv = '8bytesiv12345678'; // Panjang harus 16 karakter

String encryptPassword(String password) {
  final key = encrypt.Key.fromUtf8(_key);
  final iv = encrypt.IV.fromUtf8(_iv);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  final encrypted = encrypter.encrypt(password, iv: iv);
  return encrypted.base64;
}

String decryptPassword(String encryptedPassword) {
  final key = encrypt.Key.fromUtf8(_key);
  final iv = encrypt.IV.fromUtf8(_iv);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  final decrypted =
      encrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedPassword), iv: iv);
  return decrypted;
}
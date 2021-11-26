import 'package:steel_crypt/steel_crypt.dart';

class IsOkay {
  final fortunaKey =
      "9S3J/FDxmrIqnSDhf7w3RXo0XTsSzVv1TAZfK6QhB1E="; // keep it secret

  String keyData;

  bool isValid(String string) {
    if (string.length != 32) return false;

    return true;
  }

  String encrypIt(String text) {
    var nonce = CryptKey().genDart(len: 4);
    var aesEncrypter = AesCrypt(key: fortunaKey, padding: PaddingAES.pkcs7);
    var encrypted = aesEncrypter.gcm.encrypt(inp: 'you are awesome', iv: nonce);
    return nonce + encrypted;
  }

  String secondString(String firstString) {
    var aesEncrypter = AesCrypt(key: fortunaKey, padding: PaddingAES.pkcs7);
    try {
      keyData = aesEncrypter.gcm.decrypt(
          enc: firstString.substring(8), iv: firstString.substring(0, 8));
    } catch (e) {
      return "invalid";
    }

    return keyData;
  }
}

import 'dart:convert';

class Decoder {
  Decoder._();

  static final Decoder _instance = Decoder._();

  static Decoder get instance => _instance;

  Map<String, dynamic> jsonDecode(String body) {
    return json.decode(body) as Map<String, dynamic>;
  }
}

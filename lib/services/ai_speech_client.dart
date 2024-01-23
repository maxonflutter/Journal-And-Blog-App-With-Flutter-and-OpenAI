import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

const API_KEY = "sk-...";

class AiSpeechClient {
  final http.Client _client;

  AiSpeechClient({http.Client? client}) : _client = client ?? http.Client();

  static const String baseUrl = 'https://api.openai.com';

  Future<Map<String, dynamic>> convertTextToSpeech({
    // required String apiKey,
    required String text,
    String? model = 'tts-1',
    String? voice = 'alloy',
  }) async {
    final uri = Uri.parse('$baseUrl/v1/audio/speech');

    final response = await _client.post(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $API_KEY',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: json.encode({
        'input': text,
        'model': model,
        'voice': voice,
      }),
    );

    if (response.statusCode == 200) {
      var audioBytes = response.bodyBytes;
      return {'audioBytes': audioBytes};
    } else {
      throw Exception('Failed to convert text to speech: ${response.body}');
    }
  }
}

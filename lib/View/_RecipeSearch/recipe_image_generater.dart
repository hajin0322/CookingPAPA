import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ImageGenerator {
  Future<Uint8List?> generateImage(String prompt) async {
    final apiKey = dotenv.env['huggingFaceApiKey'];
    final url =
        'https://api-inference.huggingface.co/models/stabilityai/stable-diffusion-3.5-large';

    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({'inputs': prompt});

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print('Image generated successfully!');
        return response.bodyBytes; // Return image data
      } else {
        print('Failed response: ${response.body}');
        throw Exception('Failed to generate image: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error generating image: $e');
      return null;
    }
  }
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

class DataSource {
  // API 관련 정보
  final String? llama3ApiKey = dotenv.env['llama3ApiKey'];
  final String llama3ApiUrl = 'https://api.groq.com/openai/v1/chat/completions';
  final String? huggingFaceApiKey = dotenv.env['huggingFaceApiKey'];
  final String huggingFaceApiUrl = 'https://api-inference.huggingface.co/models/stabilityai/stable-diffusion-3.5-large';
}
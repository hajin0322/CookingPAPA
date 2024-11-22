import 'package:group_project/model/ingredient.dart'; // Ingredient 모델 import
import 'package:group_project/model/recipe.dart'; // Recipe 모델 import
import 'package:group_project/model/ingredient.dart';
import 'package:group_project/model/recipe.dart';

class DataSource {
  // API 관련 정보
  final String llama3ApiKey;
  final String llama3ApiUrl;
  final String stableDiffusionApiKey;
  final String stableDiffusionApiUrl;

  // 생성자
  DataSource({
    required this.llama3ApiKey,
    required this.llama3ApiUrl,
    required this.stableDiffusionApiKey,
    required this.stableDiffusionApiUrl,
  });
}
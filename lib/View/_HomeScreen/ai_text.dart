import 'package:flutter/cupertino.dart';
import 'dart:async'; // Timer를 사용하기 위해 추가
import 'dart:convert'; // JSON 파싱을 위해 추가
import 'package:http/http.dart' as http; // HTTP 요청을 위해 추가

import '../ViewAsset/styles/app_styles.dart';

class AIText extends StatefulWidget {
  /// 화면에 타이핑 애니메이션으로 보여줄 텍스트
  final String givenText;

  const AIText({super.key, required this.givenText});

  @override
  State<AIText> createState() => _AITextState();
}

class _AITextState extends State<AIText> {
  /// 현재 화면에 표시되고 있는 텍스트
  String displayedText = '';

  /// 현재 표시할 문자 인덱스를 추적
  int currentIndex = 0;

  /// 타이핑 애니메이션으로 보여줄 전체 텍스트
  late String targetText;

  /// 타이핑 애니메이션을 제어하는 타이머
  Timer? _timer;

  /// Groq API 키, 깃에 올리지 마세요!? 큰일 납니다? 기본 세팅 -> INS API KEY!
  final String apiKey = 'INS API KEY!'; // 조심하자?

  @override
  void initState() {
    super.initState();
    //API로부터 텍스트를 가져옴
    fetchAIResponse();
  }

  /// Groq API로부터 응답을 가져오는 함수
  Future<void> fetchAIResponse() async {
    try {
      final url = Uri.parse("https://api.groq.com/openai/v1/chat/completions");
      final headers = {
        "content-type": "application/json",
        "Authorization": "Bearer $apiKey",
      };
      final body = json.encode({
        "model": "mixtral-8x7b-32768",
        "messages": [
          {
            "role": "user",
            "content": '''
As Cooking Papa, greet the chef in a friendly and enthusiastic manner, matching one of the following styles exactly:

- "Good day chef! I am cooking papa! How can I help you today?"
- "Howdy! You ready for cooking chef? Show me what ingredients you've got!"

Response with roleplay as Cooking Papa. Don't make it too long.
            '''
          }
        ],
        'max_tokens': 50,
        'temperature': 0.0,
      });

      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        String aiText = responseData["choices"]?[0]["message"]["content"]?.trim() ?? '';

        // 가져온 텍스트가 비어있지 않은지 확인.
        targetText = aiText.isNotEmpty
            ? aiText
            : "Hello Chef! I'm Cooking Papa! Let's cook something delicious together!";

        // 타이핑 애니메이션을 시작
        startTypingAnimation();
      } else {
        // 에러가 발생한 경우 상태 코드와 응답 본문을 출력
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');

        targetText = "죄송합니다, 문제가 발생했습니다. 잠시 후 다시 시도해주세요.";

        startTypingAnimation();
      }
    } catch (e) {
      // 예외가 발생한 경우 에러 메시지를 출력
      print('Exception: $e');

      targetText = "서버에 연결할 수 없습니다. 인터넷 연결을 확인해주세요.";

      startTypingAnimation();
    }
  }

  /// 애니메이션 타이머 리셋, 멋지잖아 한잔해
  void resetAnimation() {
    _timer?.cancel(); // 기존 타이머를 취소합니다.
    displayedText = ''; // 표시된 텍스트를 초기화합니다.
    currentIndex = 0; // 문자 인덱스를 초기화합니다.
  }

  /// 주기적인 타이머를 사용하여 타이핑 애니메이션을 시작
  void startTypingAnimation() {
    // 일정 간격으로 displayedText를 업데이트하는 타이머를 생성합니다.
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (currentIndex < targetText.length) {
        setState(() {
          // 한 글자씩 displayedText에 추가합니다.
          displayedText += targetText[currentIndex];
          currentIndex++;
        });
      } else {
        // 모든 문자가 표시되면 타이머를 중지합니다.
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    // 위젯이 제거될 때 타이머를 취소하여 메모리 누수를 방지한다고 하네요..?
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 40,
        right: 40,
      ),
      child: SizedBox(
        height: 350,
        child: Text(
          displayedText,
          style: AppStyles.aiTextStyle,
        ),
      ),
    );
  }
}

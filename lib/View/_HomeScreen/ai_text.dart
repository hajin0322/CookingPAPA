import 'package:flutter/cupertino.dart';
import 'dart:async'; // Timer를 사용하기 위해 추가

import '../ViewAsset/styles/app_styles.dart';

class AIText extends StatefulWidget {
  /// 화면에 타이핑 애니메이션으로 보여줄 텍스트
  final String targetText;

  const AIText({super.key, required this.targetText});

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

  @override
  void initState() {
    super.initState();
    if (widget.targetText == "AI Error") {
      targetText = 'Loading AI Response...';
    }

    targetText = widget.targetText; // 초기 텍스트 설정
    startTypingAnimation();
  }

  @override
  void didUpdateWidget(AIText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.targetText != widget.targetText) {
      resetAnimation(); // 애니메이션 리셋
      targetText = widget.targetText; // 새로운 텍스트로 업데이트
      startTypingAnimation(); // 애니메이션 재시작
    }
  }

  /// 애니메이션 타이머 리셋, 멋지잖아 한잔해
  void resetAnimation() {
    _timer?.cancel(); // 기존 타이머를 취소합니다.
    currentIndex = 0; // 문자 인덱스를 초기화합니다.
    displayedText = ''; // 표시된 텍스트 초기화
  }

  /// 주기적인 타이머를 사용하여 타이핑 애니메이션을 시작
  void startTypingAnimation() {
    // 일정 간격으로 displayedText를 업데이트하는 타이머를 생성합니다.
    _timer = Timer.periodic(const Duration(milliseconds: 15), (timer) {
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
        top: 20,
        left: 40,
        right: 40,
        bottom: 20,
      ),
      child: SizedBox(
        height: 320,
        child: Text(
          displayedText,
          style: AppStyles.aiTextStyle,
        ),
      ),
    );
  }
}

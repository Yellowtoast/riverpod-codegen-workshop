import 'package:flutter/material.dart';
import 'package:translator_without_state_management/presentation/screen/translate_screen_state.dart';

class TranslateResultSection extends StatelessWidget {
  const TranslateResultSection({
    super.key,
    required TranslateScreenState screenState,
  }) : _screenState = screenState;

  final TranslateScreenState _screenState;

  @override
  Widget build(BuildContext context) {
    return switch (_screenState) {
      TranslateScreenStateFinished(translatedText: String text) => SizedBox(
          height: 200,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      TranslateScreenStateLoading() => const SizedBox(
          height: 200,
          width: double.infinity,
          child: CircularProgressIndicator(),
        ),
      (_) => const SizedBox.shrink(),
    };
  }
}

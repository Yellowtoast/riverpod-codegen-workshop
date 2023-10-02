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
      TranslateScreenStateFinished(translatedText: String text) => Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      TranslateScreenStateLoading() => const Expanded(
          child: SizedBox(
              width: 200,
              height: 200,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )),
        ),
      (_) => const SizedBox.shrink(),
    };
  }
}

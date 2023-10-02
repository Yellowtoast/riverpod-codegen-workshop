import 'package:flutter/material.dart';
import 'package:translator_without_state_management/presentation/component/translate_input_textfield.dart';
import 'package:translator_without_state_management/presentation/screen/translate_screen.dart';
import 'package:translator_without_state_management/presentation/screen/translate_screen_state.dart';

class TranslateSourceSection extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextCallback onChangedText;
  const TranslateSourceSection({
    super.key,
    required this.onChangedText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TranslateInputTextField(
          onChnagedText: onChangedText,
          textEditingController: textEditingController,
        ),
      ),
    );
  }
}

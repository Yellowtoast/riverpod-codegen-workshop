import 'package:flutter/material.dart';
import 'package:translator_without_state_management/common/color_util.dart';
import 'package:translator_without_state_management/presentation/component/translate_button.dart';

class TranslateButtonSection extends StatelessWidget {
  final VoidCallback onTranslate;
  const TranslateButtonSection({
    super.key,
    required this.onTranslate,
    required this.isButtonActive,
  });

  final bool isButtonActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 0.5,
          color: ColorUtil.grayScale74,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Container(
            height: 38,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: ColorUtil.grayScale222,
            ),
            child: TranslateButton(
              onTranslate: onTranslate,
              isButtonActive: isButtonActive,
            ),
          ),
        ),
      ],
    );
  }
}

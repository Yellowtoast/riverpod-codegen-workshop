import 'package:flutter/material.dart';
import 'package:translator_without_state_management/common/color_util.dart';
import 'package:translator_without_state_management/common/enum.dart';
import 'package:translator_without_state_management/presentation/component/language_dropdown_button.dart';
import 'package:translator_without_state_management/presentation/component/language_exchanger.dart';

typedef TargetLanguage = TranslateLanguage;
typedef OriginLanguage = TranslateLanguage;

class TranslateTopSection extends StatelessWidget {
  const TranslateTopSection({
    super.key,
    this.originLanguage,
    this.targetLanguage,
    required this.onOriginLanguageChanged,
    required this.onTargetLanguageChanged,
    required this.onLanguageExchanged,
  });

  final TranslateLanguage? originLanguage;

  final TranslateLanguage? targetLanguage;

  final Function(OriginLanguage?, TargetLanguage?) onLanguageExchanged;

  final Function(TranslateLanguage) onOriginLanguageChanged;

  final Function(TranslateLanguage) onTargetLanguageChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: LanguageDropdownSelector(
                  selectedLanguage: originLanguage,
                  selectableLanguageList:
                      targetLanguage?.availableTargetLangs ??
                          TranslateLanguage.values,
                  onChanged: (originLang) {
                    if (originLang != null) {
                      onOriginLanguageChanged.call(originLang);
                    }
                  },
                ),
              ),
              LanguageExchanger(
                onTapExchangeButton: () =>
                    onLanguageExchanged(targetLanguage, originLanguage),
              ),
              Expanded(
                flex: 1,
                child: LanguageDropdownSelector(
                  selectedLanguage: targetLanguage,
                  selectableLanguageList:
                      originLanguage?.availableTargetLangs ??
                          TranslateLanguage.values,
                  onChanged: (targetLang) {
                    if (targetLang != null) {
                      onTargetLanguageChanged.call(targetLang);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 0.5,
          color: ColorUtil.grayScale74,
        ),
      ],
    );
  }
}

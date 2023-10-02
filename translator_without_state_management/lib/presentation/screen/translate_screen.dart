import 'package:flutter/material.dart';
import 'package:translator_without_state_management/domain/translator.dart';
import 'package:translator_without_state_management/presentation/layout/translate_result_section.dart';
import 'package:translator_without_state_management/presentation/layout/translate_source_section.dart';
import 'package:translator_without_state_management/presentation/layout/translate_button_section.dart';
import 'package:translator_without_state_management/presentation/layout/translate_top_section.dart';
import 'package:translator_without_state_management/presentation/screen/translate_screen_state.dart';

class TranslateScreen extends StatefulWidget {
  final Translator translator;
  const TranslateScreen({super.key, required this.translator});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  TranslateScreenState _screenState = TranslateScreenStateInitial();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TranslateTopSection(
              originLanguage: _screenState.originLanguage,
              targetLanguage: _screenState.targetLanguage,
              onOriginLanguageChanged: (selectedOriginLang) {
                setState(() {
                  _screenState.originLanguage = selectedOriginLang;
                });
              },
              onTargetLanguageChanged: (selectedTargetLang) {
                setState(() {
                  _screenState.targetLanguage = selectedTargetLang;
                });
              },
              onLanguageExchanged: (originLang, targetLang) {
                setState(() {
                  _screenState.originLanguage = originLang;
                  _screenState.targetLanguage = targetLang;
                });
              },
            ),
            TranslateSourceSection(
              textEditingController: _textEditingController,
              onChangedText: (text) {
                setState(() {
                  _screenState.sourceText = text;
                });
              },
            ),
            TranslateButtonSection(
              onTranslate: () => _onTranslateTap(_screenState),
              isButtonActive: _screenState.isTranslateReady,
            ),
            TranslateResultSection(screenState: _screenState),
          ],
        ),
      ),
    );
  }

  Future<void> _onTranslateTap(TranslateScreenState translateState) async {
    if (_screenState.isTranslateReady) {
      setState(() {
        _screenState = TranslateScreenStateLoading(
          sourceText: _screenState.sourceText,
          originLanguage: _screenState.originLanguage,
          targetLanguage: _screenState.targetLanguage,
        );
      });
      final translatedText = await widget.translator.translate(
        source: _screenState.sourceText!,
        sourceLang: _screenState.originLanguage!,
        targetLang: _screenState.targetLanguage!,
      );
      setState(() {
        _screenState = TranslateScreenStateFinished(
          translatedText: translatedText,
          sourceText: _screenState.sourceText,
          originLanguage: _screenState.originLanguage,
          targetLanguage: _screenState.targetLanguage,
        );
      });
    }
  }
}

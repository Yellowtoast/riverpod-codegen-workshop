import 'package:translator_without_state_management/common/enum.dart';

sealed class TranslateScreenState {
  String? sourceText;
  TranslateLanguage? originLanguage;
  TranslateLanguage? targetLanguage;

  TranslateScreenState({
    this.sourceText,
    this.originLanguage,
    this.targetLanguage,
  });
}

extension TranslateScreenStateExtension on TranslateScreenState {
  bool get isTranslateReady =>
      originLanguage != null &&
      targetLanguage != null &&
      sourceText != null &&
      (sourceText?.isNotEmpty ?? false);

  TranslateScreenState copyWith({
    String? sourceText,
    TranslateLanguage? originLanguage,
    TranslateLanguage? targetLanguage,
    String? translatedText,
  }) {
    return switch (this) {
      TranslateScreenStateInitial _ => (this as TranslateScreenStateInitial)
          .copyWith(
              sourceText: sourceText,
              originLanguage: originLanguage,
              targetLanguage: targetLanguage),
      TranslateScreenStateFinished _ => (this as TranslateScreenStateFinished)
          .copyWith(
              translatedText: translatedText,
              sourceText: sourceText,
              originLanguage: originLanguage,
              targetLanguage: targetLanguage),
      TranslateScreenStateLoading _ => (this as TranslateScreenStateLoading)
          .copyWith(
              sourceText: sourceText,
              originLanguage: originLanguage,
              targetLanguage: targetLanguage),
    };
  }
}

class TranslateScreenStateInitial implements TranslateScreenState {
  @override
  String? sourceText;

  @override
  TranslateLanguage? originLanguage;

  @override
  TranslateLanguage? targetLanguage;

  TranslateScreenStateInitial({
    this.sourceText,
    this.originLanguage,
    this.targetLanguage,
  });
}

class TranslateScreenStateLoading implements TranslateScreenState {
  @override
  String? sourceText;

  @override
  TranslateLanguage? originLanguage;
  @override
  TranslateLanguage? targetLanguage;

  TranslateScreenStateLoading({
    this.sourceText,
    this.originLanguage,
    this.targetLanguage,
  });
}

class TranslateScreenStateFinished implements TranslateScreenState {
  @override
  String? sourceText;

  String translatedText;

  @override
  TranslateLanguage? originLanguage;

  @override
  TranslateLanguage? targetLanguage;

  TranslateScreenStateFinished({
    required this.translatedText,
    this.sourceText,
    this.originLanguage,
    this.targetLanguage,
  });

  TranslateScreenStateFinished copyWith({
    String? translatedText,
    String? sourceText,
    TranslateLanguage? originLanguage,
    TranslateLanguage? targetLanguage,
  }) =>
      TranslateScreenStateFinished(
        translatedText: translatedText ?? this.translatedText,
        sourceText: sourceText ?? this.sourceText,
        originLanguage: originLanguage ?? this.originLanguage,
        targetLanguage: targetLanguage ?? this.targetLanguage,
      );
}

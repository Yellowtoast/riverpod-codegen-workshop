enum TranslateLanguage {
  ko(displayName: '한국어', code: 'ko'),
  en(displayName: '영어', code: 'en'),
  ja(displayName: '일본어', code: 'ja'),
  zhCn(displayName: '중국어 간체', code: 'zh-CN'),
  zhTw(displayName: '중국어 번체', code: 'zh-TW'),
  vi(displayName: '베트남어', code: 'vi'),
  id(displayName: '인도네시아어', code: 'id'),
  th(displayName: '태국어', code: 'th'),
  de(displayName: '독일어', code: 'de'),
  ru(displayName: '러시아어', code: 'ru'),
  es(displayName: '스페인어', code: 'es'),
  fr(displayName: '프랑스어', code: 'fr');

  const TranslateLanguage({required this.displayName, required this.code});

  final String displayName;
  final String code;
}

extension TranslateLanguageExtension on TranslateLanguage {
  List<TranslateLanguage> get availableTargetLangs => switch (this) {
        TranslateLanguage.ko => [
            ...TranslateLanguage.values.where((element) => element != this)
          ],
        TranslateLanguage.en => [
            TranslateLanguage.ko,
            TranslateLanguage.ja,
            TranslateLanguage.fr,
            TranslateLanguage.zhCn,
            TranslateLanguage.zhTw
          ],
        TranslateLanguage.ja => [
            TranslateLanguage.ko,
            TranslateLanguage.en,
            TranslateLanguage.zhCn,
            TranslateLanguage.zhTw
          ],
        TranslateLanguage.zhCn => [
            TranslateLanguage.ko,
            TranslateLanguage.zhTw,
            TranslateLanguage.en,
            TranslateLanguage.ja,
          ],
        TranslateLanguage.zhTw => [
            TranslateLanguage.ko,
            TranslateLanguage.zhCn,
            TranslateLanguage.en,
            TranslateLanguage.ja,
          ],
        _ => [
            TranslateLanguage.ko,
          ],
      };
}

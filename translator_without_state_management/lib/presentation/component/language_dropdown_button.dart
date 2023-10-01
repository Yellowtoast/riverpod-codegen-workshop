import 'package:flutter/material.dart';
import 'package:translator_without_state_management/common/enum.dart';

class LanguageDropdownSelector extends StatelessWidget {
  const LanguageDropdownSelector({
    super.key,
    required this.selectedLanguage,
    required this.selectableLanguageList,
    this.onChanged,
  });

  final TranslateLanguage? selectedLanguage;
  final List<TranslateLanguage> selectableLanguageList;
  final void Function(TranslateLanguage?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<TranslateLanguage>(
      value: selectedLanguage,
      dropdownColor: Colors.black,
      items: selectableLanguageList
          .map((language) => DropdownMenuItem(
              value: language,
              child: Text(
                language.displayName,
              )))
          .toList(),
      onChanged: onChanged,
      alignment: Alignment.center,
      style: const TextStyle(color: Colors.white),
    );
  }
}

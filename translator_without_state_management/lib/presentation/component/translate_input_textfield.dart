import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:translator_without_state_management/common/color_util.dart';

typedef TextCallback = Function(String text);

class TranslateInputTextField extends StatefulWidget {
  final TextCallback onChnagedText;
  final TextEditingController textEditingController;
  const TranslateInputTextField({
    super.key,
    required this.onChnagedText,
    required this.textEditingController,
  });

  @override
  State<TranslateInputTextField> createState() =>
      _TranslateInputTextFieldState();
}

class _TranslateInputTextFieldState extends State<TranslateInputTextField> {
  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(_onChangedText);
  }

  @override
  void dispose() {
    widget.textEditingController.removeListener(_onChangedText);
    super.dispose();
  }

  void _onChangedText() {
    setState(() {
      widget.onChnagedText(widget.textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      maxLines: null,
      style: const TextStyle(color: Colors.white),
      cursorColor: ColorUtil.grayScale74,
      decoration: InputDecoration(
        hintText: '번역할 텍스트를 입력해주세요.',
        hintStyle: const TextStyle(
          color: ColorUtil.grayScale74,
          fontWeight: FontWeight.w400,
        ),
        border: InputBorder.none,
        suffix: widget.textEditingController.text.isEmpty
            ? null
            : GestureDetector(
                onTap: () => widget.textEditingController.clear(),
                child: const LineIcon.timesCircle(
                  color: ColorUtil.grayScale164,
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtpInputfield extends StatelessWidget {
  final List<TextEditingController> textEditingController;
  final List<FocusNode> focusnode;
  const OtpInputfield(
      {super.key,
      required this.textEditingController,
      required this.focusnode});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return Container(
          height: 78,
          width: 58,
          // color: Colors.yellow,
          alignment: Alignment.center,
          child: Theme(
            data: ThemeData(
                textSelectionTheme:
                    const TextSelectionThemeData(selectionHandleColor: Colors.green)),
            child: TextFormField(
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
              controller: textEditingController[index],
              focusNode: focusnode[index],
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                // isCollapsed: true,
                // isDense: true,
                // counterText: '',
                contentPadding: const EdgeInsets.all(10),
                border: customInputBorder(),
                enabledBorder: customInputBorder(),
                focusedBorder: customInputBorder(),
                disabledBorder: customInputBorder(),
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < 3) {
                  FocusScope.of(context).requestFocus(focusnode[index + 1]);
                } else if (value.isEmpty && index >= 0) {
                  FocusScope.of(context).requestFocus(focusnode[index - 1]);
                }
              },
              onTap: () async {
                await _handlePaste(context, index);
              },
            ),
          ),
        );
      }),
    );
  }

  OutlineInputBorder customInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );
  }

  Future<void> _handlePaste(BuildContext context, int index) async {
    ClipboardData? clipboardData =
        await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null) {
      String pasteText = clipboardData.text ?? '';
      if (pasteText.isNotEmpty &&
          pasteText.length == 4 &&
          pasteText.isNumericOnly) {
        for (int i = 0; i < pasteText.length; i++) {
          textEditingController[i].text = pasteText[i];
          if (i < 3) {
            FocusScope.of(context).requestFocus(focusnode[i + 1]);
          }
        }
      }
    }
  }
}

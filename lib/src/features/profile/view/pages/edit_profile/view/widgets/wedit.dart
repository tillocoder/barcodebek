import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/features/profile/view/pages/edit_profile/controller/edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WEdit extends StatelessWidget {
  final bool visible;
  final TextEditingController controller;
  final TextInputType textInputType;
  final List<TextInputFormatter> formater;
  final String text;

  const WEdit({
    super.key,
    required this.con,
    required this.visible,
    required this.controller,
    required this.textInputType,
    required this.formater,
    required this.text,
  });

  final EditControler con;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextFormField(
            keyboardType: textInputType,
            inputFormatters: formater,
            controller: controller,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColorss.c_FFFFFF,
              hintText: text,
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
      ),
    );
  }
}

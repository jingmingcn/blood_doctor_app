import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CellphoneField extends StatefulWidget {
  const CellphoneField({Key? key}) : super(key: key);

  @override
  State<CellphoneField> createState() => _CellphoneFieldState();
}

class _CellphoneFieldState extends State<CellphoneField> {
  final cellphoneController = TextEditingController();
  var cellphoneFormatter = MaskTextInputFormatter(
    mask: cellphoneMask,
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void initState() {
    super.initState();

    cellphoneController.addListener(handleDifferentCellphoneFormats);
  }

  @override
  void dispose() {
    cellphoneController.dispose();
    super.dispose();
  }

  void handleDifferentCellphoneFormats() {
    if (cellphoneController.text.length == 6) {
      if (cellphoneController.text[5] != '9') {
        cellphoneFormatter.updateMask(mask: cellphoneMask);
      } else {
        cellphoneFormatter.updateMask(mask: cellphoneMask);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'cellphone',
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: '手机号码',
      ),
      controller: cellphoneController,
      inputFormatters: [cellphoneFormatter],
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.match(
          r"^[1-9][0-9]{2}\-[0-9]{4}\-[0-9]{4}$",
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';

class SignUpForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String _password = "";
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            onSaved: (newValue) {},
            decoration: InputDecoration(labelText: "用户名*"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: MultiValidator(
                [
                  RequiredValidator(errorText: requiredField),
                  EmailValidator(errorText: emailError),
                ],
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (newValue) {},
              decoration: InputDecoration(labelText: "Email*"),
            ),
          ),
          TextFormField(
            onSaved: (newValue) {},
            decoration: InputDecoration(labelText: "手机号码"),
            keyboardType: TextInputType.phone,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: passwordValidator,
              obscureText: true,
              onChanged: (value) => _password = value,
              onSaved: (pass) {},
              decoration: InputDecoration(labelText: "密码*"),
            ),
          ),
          TextFormField(
            validator: (val) => MatchValidator(errorText: '两次密码不匹配')
                .validateMatch(val!, _password),
            obscureText: true,
            onSaved: (newValue) {},
            decoration: InputDecoration(labelText: "确认密码"),
          ),
          SizedBox(height: defaultPadding * 1.5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              },
              child: Text("注册"),
            ),
          ),
        ],
      ),
    );
  }
}

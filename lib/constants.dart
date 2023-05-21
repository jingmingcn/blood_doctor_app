import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const primaryColor = Color(0xFF255ED6);
const textColor = Color(0xFF35364F);
const backgroundColor = Color(0xFFE6EFF9);
const redColor = Color(0xFFE85050);

const defaultPadding = 16.0;

const emailError = '请输入正确的Email地址';
const requiredField = "必填项";

const bloodApiServer = 'bloodapi.nihds.com';

const bloodServer = 'localhost';
const bloodServerPort = 8080;

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: '密码不能为空'),
    MinLengthValidator(8, errorText: '密码长度至少是8位'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: '密码至少包括一个特殊字符')
  ],
);

const InputDecoration dropdownInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
);

const cellphoneMask = '###-####-####';

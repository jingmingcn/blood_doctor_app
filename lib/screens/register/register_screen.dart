import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:doctor/blocs/auth/auth_bloc.dart';
import 'package:doctor/exceptions/form_exceptions.dart';
import 'package:doctor/widgets/cellphone_field.dart';
import 'package:doctor/widgets/form_error_widget.dart';
import 'package:doctor/widgets/success_dialog.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  void submitForm(BuildContext context) {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final data = _formKey.currentState?.value;
      context.read<RegisterBloc>().add(
            RegisterRequestEvent(
              email: data!['email'],
              password: data['password'],
              cellphone: data['cellphone'],
              username: data['username'],
            ),
          );
    }
  }

  Future<bool> popScreen(state) async {
    return state is! RegisterLoadingState;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BlocProvider(
          create: (context) => RegisterBloc(),
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                context.read<AuthBloc>().add(
                      AuthAuthenticateEvent(state.user),
                    );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const SuccessDialog(
                      title: '成功',
                      text: '注册成功!',
                      buttonText: '继续',
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              return WillPopScope(
                onWillPop: () => popScreen(state),
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text("注册"),
                    leading: IconButton(
                      onPressed: () async {
                        if (await popScreen(state)) {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.arrow_back),
                      splashRadius: 23,
                    ),
                  ),
                  body: Builder(
                    builder: (_) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: FormBuilder(
                              key: _formKey,
                              child: Builder(builder: (context) {
                                if (state is RegisterErrorState) {
                                  if (state.exception is FormFieldsException) {
                                    for (var error in (state.exception
                                            as FormFieldsException)
                                        .errors
                                        .entries) {
                                      _formKey.currentState?.invalidateField(
                                        name: error.key,
                                        errorText: error.value,
                                      );
                                    }
                                  }
                                }

                                return Column(
                                  children: [
                                    Builder(builder: (context) {
                                      if (state is RegisterErrorState) {
                                        if (state.exception
                                            is FormGeneralException) {
                                          return Column(
                                            children: [
                                              FormErrorWidget(
                                                (state.exception
                                                        as FormGeneralException)
                                                    .message,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              )
                                            ],
                                          );
                                        }
                                      }
                                      return Container();
                                    }),
                                    FormBuilderTextField(
                                      name: 'username',
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '用户名',
                                      ),
                                      textInputAction: TextInputAction.next,
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.match(
                                          r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$",
                                        ),
                                      ]),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CellphoneField(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    FormBuilderTextField(
                                      name: 'email',
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Email',
                                      ),
                                      textInputAction: TextInputAction.next,
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.email(),
                                      ]),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    FormBuilderTextField(
                                      name: 'password',
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Password',
                                      ),
                                      obscureText: true,
                                      textInputAction: TextInputAction.done,
                                      onSubmitted: (_) {
                                        if (state is! AuthLoadingState) {
                                          submitForm(context);
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MaterialButton(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      onPressed: () {
                                        if (state is! RegisterLoadingState) {
                                          submitForm(context);
                                        }
                                      },
                                      child: (state is RegisterLoadingState)
                                          ? const Center(
                                              child: SizedBox(
                                                height: 15,
                                                width: 15,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 2,
                                                ),
                                              ),
                                            )
                                          : const SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                '注册',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

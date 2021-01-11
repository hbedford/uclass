import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uclass/src/login/login_controller.dart';
import 'package:uclass/src/widgets/logo_widget.dart';

import 'package:flutter/foundation.dart' as platform;
import 'package:uclass/src/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  final controller = GetIt.I.get<LoginController>();
  TextStyle style;
  @override
  Widget build(BuildContext context) {
    style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraint) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xff13191E),
                      borderRadius: BorderRadius.circular(20)),
                  height: constraint.maxHeight * 0.6,
                  width: platform.kIsWeb
                      ? constraint.maxWidth * 0.3
                      : constraint.maxWidth * 0.8,
                  child: ValueListenableBuilder(
                      valueListenable: controller.type,
                      builder: (context, value, child) => value
                          ? register(constraint, context)
                          : login(constraint, context)))
            ],
          ),
        ),
      ),
    );
  }

  login(BoxConstraints constraint, BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          top(constraint),
          /* Container(
                      margin: EdgeInsets.only(top: constraint.maxHeight * 0.03),
                    ), */
          Column(
            children: [
              TextFieldWidget(
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.02,
                    horizontal: constraint.maxWidth * 0.05,
                  ),
                  controller: controller.email.value,
                  hint: 'E-mail'),
              TextFieldWidget(
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.02,
                    horizontal: constraint.maxWidth * 0.05,
                  ),
                  controller: controller.password.value,
                  hint: 'Senha'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                padding:
                    EdgeInsets.symmetric(horizontal: constraint.maxWidth * 0.1),
                /* shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ), */
                onPressed: () => controller.confirm(context),
                child: Text(
                  'Entrar',
                  style: style,
                ),
              )
            ],
          ),
          FlatButton(
              onPressed: () => null,
              child: Text(
                'Problemas com login?',
                style: style.copyWith(
                  color: Colors.grey,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              ))
        ],
      );
  register(BoxConstraints constraint, BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          top(constraint),
          ValueListenableBuilder(
            valueListenable: controller.step,
            builder: (context, value, child) => value == 0
                ? step1(constraint, context)
                : value == 1
                    ? step2(constraint, context)
                    : step3(constraint, context),
          )
        ],
      );
  step1(BoxConstraints constraint, BuildContext context) => Column(
        children: [
          Column(
            children: [
              TextFieldWidget(
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.02,
                    horizontal: constraint.maxWidth * 0.05,
                  ),
                  controller: controller.email.value,
                  hint: 'E-mail'),
              TextFieldWidget(
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.02,
                    horizontal: constraint.maxWidth * 0.05,
                  ),
                  controller: controller.password.value,
                  hint: 'Senha'),
              TextFieldWidget(
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.02,
                    horizontal: constraint.maxWidth * 0.05,
                  ),
                  controller: controller.repeatPassword.value,
                  hint: 'Confirmar senha'),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: constraint.maxHeight * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () => controller.changeStep(1),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('PRÓXIMO'),
                ),
                RaisedButton(
                  onPressed: () => null,
                  color:
                      Theme.of(context).buttonTheme.colorScheme.primaryVariant,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Cancelar'),
                )
              ],
            ),
          )
        ],
      );
  step2(BoxConstraints constraint, BuildContext context) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            Column(
              children: [
                ValueListenableBuilder(
                    valueListenable: controller.email.value,
                    builder: (context, value, child) => Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: constraint.maxWidth * 0.15,
                              vertical: constraint.maxHeight * 0.05),
                          child: Text(
                            'Enviamos um código para seu e-mail ${value.text}',
                            style: style,
                            textAlign: TextAlign.center,
                          ),
                        )),
                TextFieldWidget(
                  margin: EdgeInsets.symmetric(
                      horizontal: constraint.maxWidth * 0.05),
                  controller: controller.code.value,
                  hint: 'Digite aqui seu codigo',
                ),
              ],
            ),
            Text(
              'Reenviar codigo 00:57',
              style: style.copyWith(
                  decoration: TextDecoration.underline, fontSize: 12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () => controller.changeStep(2),
                  child: Text('CONFIRMAR'),
                ),
                RaisedButton(
                  color:
                      Theme.of(context).buttonTheme.colorScheme.primaryVariant,
                  onPressed: () => controller.changeStep(0),
                  child: Text('voltar'),
                )
              ],
            )
          ],
        ),
      );
  step3(BoxConstraints constraint, BuildContext context) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Complete seu perfil',
              style: style,
            ),
            CircleAvatar(
              radius: constraint.maxWidth * 0.1,
              child: Stack(
                children: [
                  Positioned(
                    child: Icon(Icons.camera_alt),
                    bottom: 0,
                    right: 0,
                  )
                ],
              ),
            ),
            TextFieldWidget(
              controller: controller.name.value,
              margin:
                  EdgeInsets.symmetric(horizontal: constraint.maxWidth * 0.05),
              hint: 'Nome',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: ['Professor', 'Aluno', 'Outro']
                  .map((e) => ValueListenableBuilder(
                      valueListenable: controller.function,
                      builder: (context, value, child) => InkWell(
                            onTap: () => controller.changeFunction(e),
                            child: value == e
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    margin: EdgeInsets.symmetric(
                                        vertical: constraint.maxHeight * 0.01,
                                        horizontal: constraint.maxWidth * 0.2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          e,
                                          style: style,
                                        ),
                                        Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: constraint.maxHeight * 0.01,
                                    ),
                                    child: Text(
                                      e,
                                      style: style,
                                    ),
                                  ),
                          )))
                  .toList(),
            ),
            RaisedButton(
              onPressed: () => controller.confirm(context),
              child: Text('CONFIRMAR'),
            )
          ],
        ),
      );
  top(BoxConstraints constraint) => Row(
        children: [
          ValueListenableBuilder(
            valueListenable: controller.type,
            builder: (context, value, child) => GestureDetector(
              onTap: () => controller.changeType(false),
              child: Container(
                  height: constraint.maxHeight * 0.1,
                  width: platform.kIsWeb
                      ? constraint.maxWidth * 0.15
                      : constraint.maxWidth * 0.4,
                  decoration: BoxDecoration(
                      color: value ? Color(0xff1D242A) : Color(0xff13191E),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20))),
                  child: Center(
                      child: Text('Login',
                          style: style.copyWith(
                              color: value ? Color(0xff20C598) : null)))),
            ),
          ),
          ValueListenableBuilder(
              valueListenable: controller.type,
              builder: (context, value, child) => GestureDetector(
                    onTap: () => controller.changeType(true),
                    child: Container(
                      height: constraint.maxHeight * 0.1,
                      width: platform.kIsWeb
                          ? constraint.maxWidth * 0.15
                          : constraint.maxWidth * 0.4,
                      decoration: BoxDecoration(
                          color: value ? Color(0xff13191E) : Color(0xff1D242A),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(20))),
                      child: Center(
                          child: Text(
                        'Registro',
                        style: style.copyWith(
                            color: value ? null : Color(0xff20C598)),
                      )),
                    ),
                  ))
        ],
      );
}

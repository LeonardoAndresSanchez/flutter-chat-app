import 'package:chat_app/widgets/custom_buttom.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';

import '../widgets/labels.dart';
import '../widgets/logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(
                  label: 'Registro',
                ),
                _Form(),
                Labels(
                  route: 'login',
                  label: 'Ya tienes una cuenta?',
                  subLabel: 'Ingresa Ahora!',
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    'Terminos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomInput(
              placeholder: 'Nombre',
              icon: Icons.perm_identity_rounded,
              keyboardType: TextInputType.text,
              textController: nameCtrl,
            ),
            CustomInput(
              placeholder: 'Correo',
              icon: Icons.mail_outline_outlined,
              keyboardType: TextInputType.emailAddress,
              textController: emailCtrl,
            ),
            CustomInput(
              placeholder: 'Contreseña',
              textController: passCtrl,
              isPassword: true,
              icon: Icons.lock_outline_rounded,
            ),
            CustomButton(
              text: 'Ingrese',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

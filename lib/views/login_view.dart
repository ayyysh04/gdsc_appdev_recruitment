import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_appdev/enums/pageNavigatorMethod.dart';
import 'package:gdsc_appdev/components/primary_button.dart';
import 'package:gdsc_appdev/components/transparent_text_form.dart';
import 'package:gdsc_appdev/constants/constants.dart';
import 'package:gdsc_appdev/routes/route_constants.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/view_models/signin_screen_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final SigninScreenViewModel _model = locator.get<SigninScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _model.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Spacer(),
                SvgPicture.asset(
                  "assets/images/login_screen.svg",
                  alignment: Alignment.topCenter,
                  height: 300,

                  // fit: BoxFit.fitWidth,
                ),
                Spacer(),
                Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: kDefaultPadding * 1.5),
                TransparentTextForm(
                  focusNode: _model.phoneFocusNode,
                  text: "Email",
                  controller: _model.phoneController,
                  validator: _model.emailValidation,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: kDefaultPadding),
                TransparentTextForm(
                  focusNode: _model.passwordFocusNode,
                  text: "Password",
                  controller: _model.passwordController,
                  obscureText: true,
                  validator: _model.passwordValidation,
                ),
                SizedBox(height: kDefaultPadding),
                PrimaryButton(text: "Sign In", press: _model.signInNavigator),
                SizedBox(height: kDefaultPadding * 1.5),
                TextButton(
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _model.forgotPassword,
                ),
                SizedBox(height: kDefaultPadding * 1),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.subtitle2,
                    text: "Don't have an account?  ",
                    children: <InlineSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: 'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor)),
                    ],
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

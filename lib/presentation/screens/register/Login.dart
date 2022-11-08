import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_day_one/Bussiness_logic/login/login_cubit.dart';
import 'package:odc_day_one/constants/constant_methods.dart';
import 'package:odc_day_one/presentation/screens/Home.dart';
import 'package:odc_day_one/presentation/screens/register/SignUp.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Buttons.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Email_txt.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Password_txt.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
bool visible = false;

class _LoginState extends State<Login> {
  static final GlobalKey<FormState> loginkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCupit = LoginCubit.get(context);
    return SafeArea(
        child: BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: loginkey,
            child: ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Orange ",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange)),
                    Text("Digital Center",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                EmailTxt(
                  Action: TextInputAction.next,
                  hintTxt: "Email",
                  labelText: "Email",
                  keyBoardType: TextInputType.emailAddress,
                  validate:(value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Email';
                    } else if (!RegExp(
                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                        .hasMatch(value)) {
                      return 'Please Enter Valid as example@gmail.com';
                    }
                  },
                  control: emailController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                PasswordTxt(
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                    },

                    secured: visible == false ? true : false,
                    control: passwordController,
                    icon: visible == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    ontap: () {
                      visible = !visible;
                      setState(() {});
                    },

                    Action: TextInputAction.done,
                    hintTxt: "Password",
                    keyBoardType: TextInputType.visiblePassword,
                    labelText: "Password"),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                InkWell(
                    onTap: () {},
                    child: const Text("Forgot Password?",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline))),
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                Buttons(
                    txt: "Login",
                    backGroundClr: Colors.deepOrangeAccent,
                    BorderClr: Colors.transparent,
                    ontap: () {
                      if (loginkey.currentState!.validate()) {
                        loginCupit.postLogin(
                            email: emailController.text,
                            password: passwordController.text);
                        flutterToast(msg: "Logged in successfully", color: Colors.green);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const HomeScreen(),
                      //     ));
                    },
                    txtClr: Colors.white),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 10,
                      ),
                    ),
                    Text("OR",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20)),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        indent: 10,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                Buttons(
                    txt: "Sign Up",
                    backGroundClr: Colors.white,
                    BorderClr: Colors.deepOrangeAccent,
                    ontap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ));
                    },
                    txtClr: Colors.deepOrangeAccent),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

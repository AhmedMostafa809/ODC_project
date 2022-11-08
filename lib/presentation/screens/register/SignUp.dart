import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_day_one/Bussiness_logic/register/register_cubit.dart';
import 'package:odc_day_one/constants/constant_methods.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Buttons.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Email_txt.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Password_txt.dart';
import 'package:sizer/sizer.dart';

import 'Login.dart';
class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

TextEditingController phoneController = TextEditingController();

TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
bool visible = false;
TextEditingController passwordConfirmController = TextEditingController();
TextEditingController nameController = TextEditingController();
bool visibleConfirm = false;

String dropdownvalue = 'Male';

// List of items in our dropdown menu
var genderItems = [
  'Male',
  'Female',
];
String dropdownvalue2 = 'ASU';

// List of items in our dropdown menu
var collegeItems = [
  'ASU',
  'AUC',
];
String dropdownvalue3 = '1';

// List of items in our dropdown menu
var gradeItems = ['1', '2', '3', '4'];
class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> registerKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit=RegisterCubit.get(context);
    return SafeArea(
        child: BlocBuilder<RegisterCubit,RegisterState>(
          builder :(context, state) =>  Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: registerKey,
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
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Sign Up",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                EmailTxt(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Name';
                    } else if (value.length > 32) {
                      return 'Name Must be less than 32 characters';
                    }
                  },
                  formater: [
                    FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                  ],
                  Action: TextInputAction.next,
                  hintTxt: "Name",
                  labelText: "Name",
                  keyBoardType: TextInputType.name,
                  control: nameController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                EmailTxt(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Phone Number';
                    } else if (value.length != 11) {
                      return "Phone Number Must be 11 Number";
                    }
                  },
                  control: phoneController,
                  Action: TextInputAction.next,
                  hintTxt: "Phone",
                  keyBoardType: TextInputType.phone,
                  labelText: "Phone",
                  formater: [
                    FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]')),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                EmailTxt(
                  validate:(value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Email';
                    } else if (!RegExp(
                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                        .hasMatch(value)) {
                      return 'Please Enter Valid as example@gmail.com';
                    }
                  },

                  Action: TextInputAction.next,
                  hintTxt: "Email",
                  labelText: "Email",
                  keyBoardType: TextInputType.emailAddress,
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
                    icon:
                        visible == false ? Icons.visibility_off : Icons.visibility,
                    ontap: () {
                      visible = !visible;
                      setState(() {});
                    },
                    Action: TextInputAction.next,
                    hintTxt: "Password",
                    keyBoardType: TextInputType.visiblePassword,
                    labelText: "Password"),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                PasswordTxt(
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                    },
                    secured: visibleConfirm == false ? true : false,
                    control: passwordConfirmController,
                    icon: visibleConfirm == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    ontap: () {
                      visibleConfirm = !visibleConfirm;
                      setState(() {});
                    },
                    Action: TextInputAction.done,
                    hintTxt: "Confirm Password",
                    keyBoardType: TextInputType.visiblePassword,
                    labelText: "Confirm Password"),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Gender",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * .02),
                        Container(
                          height: 6.h,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.orange),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [
                                  const DropdownMenuItem(
                                    value: 'm',
                                    child: Text('Male'),
                                  ),
                                  const DropdownMenuItem(
                                    value: 'f',
                                    child: Text('Female'),
                                  ),
                                ],
                                onChanged: (value) {
                                  registerCubit.changeGender(value);
                                },
                                value: registerCubit.gender,
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                    Column(
                      children: [
                        const Text(
                          "University",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * .02),
                        Container(
                            height: 6.h,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.orange),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                focusColor: Colors.orange,
                                value: dropdownvalue2,
                                items: collegeItems.map((String items2) {
                                  return DropdownMenuItem(
                                    value: items2,
                                    child: Text(items2),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue2 = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "Grade",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .02),
                      Container(
                        height: 6.h,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.orange),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              focusColor: Colors.orange,
                              value: dropdownvalue3,
                              items: gradeItems.map((String items3) {
                                return DropdownMenuItem(
                                  value: items3,
                                  child: Text(items3),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue3 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                Buttons(
                    txt: "Sign Up",
                    backGroundClr: Colors.white,
                    BorderClr: Colors.deepOrangeAccent,
                    ontap: () {
                      if (registerKey.currentState!.validate()) {
                        if(passwordController.text==passwordConfirmController.text){
                          registerCubit.postRegister(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phoneNumber: phoneController.text,
                              gender: registerCubit.gender == "Male" ? "m" : "Female",
                              context: context);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login(),));
                        }else {
                          flutterToast(msg: "Password not match", color: Colors.red);
                        }

                      }



                    },
                    txtClr: Colors.deepOrangeAccent),
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
                        style:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
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
                    txt: "Login",
                    backGroundClr: Colors.deepOrangeAccent,
                    BorderClr: Colors.transparent,
                    ontap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login(),));
                    },
                    txtClr: Colors.white),
              ],
            ),
          ),
      ),
    ),
        ));
  }
}

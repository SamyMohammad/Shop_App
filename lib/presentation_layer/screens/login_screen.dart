import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/constatnts/theme_manager.dart';
import 'package:shop_app/domain_layer/bloc/shop_login_cubit/shop_login_cubit.dart';
import 'package:shop_app/domain_layer/bloc/shop_login_cubit/shop_login_state.dart';
import 'package:shop_app/presentation_layer/components/default_textfield.dart';
import 'package:shop_app/presentation_layer/components/toast.dart';
import 'package:shop_app/presentation_layer/screens/main_screen.dart';

import '../../constatnts/constatnts.dart';
import '../../data_layer/local/cache_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'login screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();

    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'assets/695.jpg'),
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ShopLoginCubit(),
        child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
          listener: (context, state) {
            if(state is ShopLoginSuccessState){

              if(state.login.status!){
                showToast(text: state.login.message!, state: ToastState.SUCCESS);
                print(state.login.data!.token);
                print(state.login.message);
                CacheHelper.saveData(key: 'token', value: state.login.data!.token).then((value){token = state.login.data!.token;Navigator.pushReplacementNamed(context, MainScreen.routeName); });
              }
              else{
             showToast(text: state.login.message!, state: ToastState.ERROR);
                print(state.login.message);
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  stops: [0.3, 0.5, 0.9],
                  colors: [
                    Color(0xFFC8D3FF),
                    Color(0xFFD7DDFF),
                    Color(0xFFECEAFF)
                  ],
                )),
                child: Form(
                  key: formKey,
                  child: Column(

                    children: [
                      Image.asset('assets/695.jpg'),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Material(
                            elevation: 2.0,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            //Email input
                            child: defaultTextField(
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty || !value.isValidEmail()) {
                                  return 'Email is wrong';
                                }
                                return null;
                              },
                              isHidden: false,
                              onChanged: (value) {
                                emailController.text = value;
                              },
                              hintText: 'Email',
                              prefix: Icons.email,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Material(
                          elevation: 2.0,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          //password input
                          child: defaultTextField(
                            onFieldSubmitted: (value){ if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password:
                                  passwordController.text);
                            }},
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is too short';
                              }
                              return null;
                            },
                            isHidden: ShopLoginCubit.get(context).isVisible,
                            onChanged: (String value) {
                              passwordController.text = value;
                            },
                            hintText: 'Password',
                            prefix: Icons.lock,
                            suffix: ShopLoginCubit.get(context).suffix,
                              suffixPressed:(){
                                ShopLoginCubit.get(context).toggleVisibility();
                              }
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: ConditionalBuilder(
                              condition: state is! ShopLoginLoadingStates,
                              builder: (context) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    width: 300,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100)),
                                        color: Theme.of(context).primaryColor),
                                    child: TextButton(
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          ShopLoginCubit.get(context).userLogin(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      },
                                    ),
                                  ),
                              fallback: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ))),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "FORGOT PASSWORD ?",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Don't have an Account ? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                          Text("Sign Up ",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

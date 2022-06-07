import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domain_layer/bloc/shop_cubit/shop_cubit.dart';

import '../../constatnts/constatnts.dart';
import '../components/default_textfield.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {

        // TODO: implement listener
      },
      builder: (context, state) {
        var model = ShopCubit.get(context).loginModel;
        nameController.text =model!.data!.name!;
        emailController.text =model.data!.email!;
        phoneController.text =model.data!.phone!;

        return ConditionalBuilder(
            condition: ShopCubit.get(context).loginModel != null,
            builder: (context) => Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //Name
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: defaultTextField(
                            controller: nameController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'name must not be empty';
                              }
                              return null;
                            },
                            isHidden: false,
                            type: TextInputType.name,
                            prefix: Icons.person,
                            hintText: 'Name'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Email
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: defaultTextField(
                            controller: emailController,
                            hintText: 'Email Address',
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'email must not be empty';
                              }
                              return null;
                            },
                            isHidden: false,
                            type: TextInputType.emailAddress,
                            prefix: Icons.email_outlined),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //phone
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: defaultTextField(
                            controller: phoneController,
                            hintText: 'Phone',
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'phone must not be empty';
                              }
                              return null;
                            },
                            isHidden: false,
                            type: TextInputType.phone,
                            prefix: Icons.phone),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton( child: const Text('Logout',style: TextStyle(color: Colors.white),),onPressed:(){signOut(context);},style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red)),)
                    ],
                  ),
                ),
            fallback: (context) => const CircularProgressIndicator());
      },
    );
  }
}

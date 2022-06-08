import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domain_layer/bloc/shop_cubit/shop_cubit.dart';
import 'package:shop_app/presentation_layer/widget_builders/home_builder.dart';
import 'package:shop_app/presentation_layer/components/toast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {

        if(state is ShopSuccessFavouritesState){
          if (!state.model.status!) {
showToast(text: state.model.message!, state:ToastState.ERROR );
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null &&
                ShopCubit.get(context).categoriesModel != null,
            builder: (context) => HomeBuilder(
                  homeModel: ShopCubit.get(context).homeModel,
                  categoriesModel: ShopCubit.get(context).categoriesModel,
                ),
            fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }
}

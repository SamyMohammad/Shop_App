import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domain_layer/bloc/shop_cubit/shop_cubit.dart';

import '../widget_builders/build_categories_item_in_categories_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) => buildCategoriesItems(ShopCubit.get(context).categoriesModel!.data!.data![index]),
            separatorBuilder: (context, index) => const Divider(height: 5),
            itemCount: ShopCubit.get(context).categoriesModel!.data!.data!.length);
      },
    );
  }
}


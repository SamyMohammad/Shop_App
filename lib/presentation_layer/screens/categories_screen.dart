import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data_layer/models/CategoriesModel.dart';
import 'package:shop_app/domain_layer/bloc/shop_cubit/shop_cubit.dart';

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

Widget buildCategoriesItems(CategoryData categoryData) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(categoryData.image!),
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 20,
        ),
         Text(
          categoryData.name!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios)
      ],
    ),
  );
}

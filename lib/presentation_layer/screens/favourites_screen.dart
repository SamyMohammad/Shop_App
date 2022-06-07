import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data_layer/models/GetFavouritesModel.dart';

import '../../domain_layer/bloc/shop_cubit/shop_cubit.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            builder:(BuildContext context)=> Container(
              padding:  const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>  BuildFavouriteItem(favouritesData: ShopCubit.get(context).getFavouritesModel!.data!.data![index]),
                  separatorBuilder: (context, index) =>
                     const Divider(height: 5,color: Colors.black26,thickness: 1,),
                  itemCount:  ShopCubit.get(context).getFavouritesModel!.data!.data!.length),
            ),
            condition: state is! ShopLoadingGetFavouritesState,
            fallback: (BuildContext context) { return const CircularProgressIndicator(); },
          );
        }

    );
  }
}
class BuildFavouriteItem extends StatelessWidget {
   BuildFavouriteItem({Key? key, this.favouritesData}) : super(key: key);
  FavouritesData? favouritesData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 140,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
               Image(
                image: NetworkImage(
                    favouritesData!.product!.image! ),
                width: 140,
                height: 140,
              ),
              favouritesData!.product!.discount! != 0
                  ? Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Text(
                    'Discount',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ))
                  : Container(),
            ],
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  favouritesData!.product!.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.3,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '${favouritesData!.product!.price!.round()}',
                      style: TextStyle(
                          fontSize: 16, color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                     Text(
                       favouritesData!.product!.discount  != 0 ? '${favouritesData!.product!.oldPrice!.round()}' : '',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          ShopCubit.get(context).changeFavourites(favouritesData!.product!.id);
                          // print(products[index].inFavorites);
                        },
                        child:  CircleAvatar(
                          radius: 15,
                          backgroundColor: ShopCubit.get(context).favourites[favouritesData!.product!.id]! ? Colors.red : Colors.grey,
                          child: const Icon(
                            Icons.favorite_border,
                            size: 16,
                            color: Colors.white,
                          ),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



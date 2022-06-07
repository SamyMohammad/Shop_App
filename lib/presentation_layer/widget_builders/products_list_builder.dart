import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/domain_layer/bloc/shop_cubit/shop_cubit.dart';

import '../../data_layer/models/Home.dart';

class ProductsListBuilder extends StatefulWidget {
  ProductsListBuilder({this.homeModel, Key? key}) : super(key: key);
  HomeModel? homeModel;

  @override
  State<ProductsListBuilder> createState() => _ProductsListBuilderState();
}

class _ProductsListBuilderState extends State<ProductsListBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController lottieController;
  @override
  void initState() {
    lottieController = AnimationController(
      vsync: this,
    );
    lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        lottieController.stop(canceled: true);
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = widget.homeModel!.data!.products;
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: .65,
      children: List.generate(
          products!.length,
          (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Image(
                            image: NetworkImage('${products[index].image}'),
                            width: 160,
                            height: 160,
                          ),
                          products[index].discount != 0
                              ? Container(
                                  color: Colors.red,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: const Text(
                                    'Discount',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ))
                              : Container(),
                        ],
                      ),
                      Text(
                        widget.homeModel!.data!.products![index].name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.3,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            '${products[index].price!.round()}',
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            products[index].discount != 0
                                ? '${products[index].oldPrice!.round()}'
                                : '',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                ShopCubit.get(context)
                                    .changeFavourites(products[index].id);
                                print(products[index].inFavorites);

                              },
                              child:  CircleAvatar(
                                radius: 15,
                                backgroundColor: ShopCubit.get(context).favourites[products[index].id] == true  ? Colors.red :Colors.grey,
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
                ),
              )),
    );
  }
}

// Lottie.asset(
// 'assets/lottie_love.json',
// height: 20,
// width: 20,
// fit: BoxFit.cover,
// repeat: true,
// controller:lottieController ,
//
// onLoaded: (composition) {
// lottieController.duration = composition.duration;
// lottieController.forward();
// }
// )

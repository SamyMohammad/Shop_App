import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/data_layer/models/CategoriesModel.dart';
import 'package:shop_app/presentation_layer/widget_builders/products_list_builder.dart';

import '../../data_layer/models/Home.dart';
import 'categories_list_builder.dart';

class HomeBuilder extends StatelessWidget {
  HomeBuilder({this.categoriesModel,this.homeModel, Key? key}) : super(key: key);
  CategoriesModel? categoriesModel;
  HomeModel? homeModel;
  @override
  Widget build(BuildContext context) {
    final modelData = homeModel!.data!.banners!;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items: modelData
                  .map((e) => Image(
                        image: NetworkImage('${e.image}'),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ))
                  .toList(),
              options: CarouselOptions(
                  viewportFraction: 1,
                  height: 250,
                  autoPlay: true,
                  initialPage: 0,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal)),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text('Categories',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 10,
                ),
                CategoriesListBuilder(categoriesModel: categoriesModel,),
                const SizedBox(
                  height: 10,
                ),
                const Text('New Products',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const SizedBox(height: 5),
          ProductsListBuilder(
            homeModel: homeModel,
          )
        ],
      ),
    );
  }
}

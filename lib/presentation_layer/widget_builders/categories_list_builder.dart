import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_app/data_layer/models/CategoriesModel.dart';

class CategoriesListBuilder extends StatelessWidget {
  CategoriesListBuilder({this.categoriesModel, Key? key}) : super(key: key);
  CategoriesModel? categoriesModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                   Image(
                    image: NetworkImage(
                      categoriesModel!.data!.data![index].image!,
                    ),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 100,
                    height: 25,
                    color: Colors.black.withOpacity(.8),
                    child:  Text(
                      categoriesModel!.data!.data![index].name!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
          separatorBuilder: (context, index) => Container(
                width: 5,
              ),
          itemCount: categoriesModel!.data!.data!.length,),
    );
  }
}

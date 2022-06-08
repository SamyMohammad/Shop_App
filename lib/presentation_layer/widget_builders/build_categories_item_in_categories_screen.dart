import 'package:flutter/material.dart';

import '../../data_layer/models/CategoriesModel.dart';

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

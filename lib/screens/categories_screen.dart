import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              key: ValueKey(catData.id),
              id: catData.id,
              title: catData.title,
              color: catData.color,
            ),
          )
          .toList(),
    );
  }
}

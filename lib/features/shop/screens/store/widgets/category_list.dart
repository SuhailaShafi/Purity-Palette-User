import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:purity_pallette/features/shop/model/category/category_model.dart';
import 'package:purity_pallette/features/shop/screens/store/widgets/hair_category_list.dart';
import 'package:purity_pallette/features/shop/screens/store/widgets/makeup_category_list.dart';
import 'package:purity_pallette/features/shop/screens/store/widgets/skin_category_list.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.categoryType});
  final String categoryType;
  @override
  Widget build(BuildContext context) {
    if (categoryType == 'Hair') {
      return HairCatList();
    } else if (categoryType == 'Skin') {
      return SkinCatList();
    } else if (categoryType == 'Makeup') {
      return MakeuppCatList();
    } else
      return Text('no data found');
  }
}



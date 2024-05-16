import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/widgets/texts/brand_name_with_verified_icon.dart';
import 'package:purity_pallette/features/shop/controller/category/category_controller.dart';
import 'package:purity_pallette/utils/constants/enums.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key, this.cat});
  final cat;
  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 20.0, // Spacing between columns
        mainAxisSpacing: 20.0, // Spacing between rows
        childAspectRatio: 1.0, // Aspect ratio of each grid item
      ),
      itemBuilder: (context, index) {
        final category = cat[index];
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                    child: BrandTitkeText(
                  title: category.name.toString(),
                  color: Colors.black,
                  maxLines: 1,
                  brandTextSize: TextSizes.large,
                )),
              ),
              const SizedBox(height: 10),
              // Use category properties to display data
              Image.network(
                category
                    .imageUrl, // Assuming imageUrl property is available in CategoryType
                width: MediaQuery.of(context).size.width * 0.3,
                height: 100,
                fit: BoxFit.cover,
              ),

              // Assuming name property is available in CategoryType
              // Add other widgets as needed
            ],
          ),
        );
      },
      itemCount: cat.length,
    );
  }
}

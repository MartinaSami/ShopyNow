import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/home/categories/categories_of_categories_num2.dart';
import 'package:shopy_now/widgets/custom_text.dart';

import '../../constants.dart';
import 'one_category_api.dart';

// ignore: must_be_immutable
class CategoriesOfCategory extends StatelessWidget {
  String categoryName;
  String categoryId;

  CategoriesOfCategory({this.categoryName, this.categoryId});

  @override
  Widget build(BuildContext context) {
    var oneCategory = Provider.of<GetOneCategoryProvider>(context);
    oneCategory.categoriesOfCategory(categoryId);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: categoryName,
        ),
        iconTheme: IconThemeData(
          color: secondaryColor, //change your color here
        ),
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Consumer<GetOneCategoryProvider>(
              builder: (ctx, categoryOfCategoriesProvider, _) {
                return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return categoryOfCategoriesProvider
                                  .getCategoriesOfCategoryData ==
                              null
                          ? Center(child: CircularProgressIndicator())
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return CategoriesOfCategoriesNum2(
                                        categoryName:
                                            categoryOfCategoriesProvider
                                                .categoriesOfCategoryData
                                                .data[index]
                                                .name,
                                        categoryId: categoryOfCategoriesProvider
                                            .categoriesOfCategoryData
                                            .data[index]
                                            .id
                                            .toString(),
                                      );
                                    }),
                                  );
                                },
                                child: Card(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                            text: categoryOfCategoriesProvider
                                                .categoriesOfCategoryData
                                                .data[index]
                                                .name),
                                        Image.network(
                                          categoryOfCategoriesProvider
                                              .categoriesOfCategoryData
                                              .data[index]
                                              .imagePath,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                          height: 10,
                        ),
                    itemCount:
                        categoryOfCategoriesProvider.categoriesOfCategoryCount);
              },
            ),
          ),
        ],
      ),
    );
  }
}

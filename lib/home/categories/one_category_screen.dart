import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/home/categories/categories_of_category.dart';
import 'package:shopy_now/home/categories/one_category_api.dart';
import 'package:shopy_now/widgets/custom_text.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class OneCategoryScreen extends StatelessWidget {
  static const String id = 'OneCategoryScreen';
  String categoryId, categoryName;

  OneCategoryScreen({this.categoryId, this.categoryName});

  @override
  Widget build(BuildContext context) {
    var oneCategory = Provider.of<GetOneCategoryProvider>(context);
    oneCategory.oneCategoryFun(categoryId);

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
              builder: (ctx, oneCategoryProvider, _) {
                return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return oneCategoryProvider.oneCategoryData == null
                          ? Center(child: CircularProgressIndicator())
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CategoriesOfCategory(
                                      categoryName: oneCategoryProvider
                                          .oneCategoryData.data[index].name,
                                      categoryId: oneCategoryProvider
                                          .oneCategoryData.data[index].id
                                          .toString(),
                                    );
                                  }));
                                },
                                child: Card(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: oneCategoryProvider
                                              .oneCategoryData.data[index].name,
                                        ),
                                        Image.network(
                                          oneCategoryProvider.oneCategoryData
                                              .data[index].imagePath,
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
                    itemCount: oneCategory.oneCategoryCount);
              },
            ),
          ),
        ],
      ),
    );
  }
}

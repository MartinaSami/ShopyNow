import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/home/categories/categories_api_provider.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class ProductsScreen extends StatelessWidget {
  static const String id = 'ProductsScreen';
  @override
  Widget build(BuildContext context) {
    var categories = Provider.of<GetCategories>(context);
    categories.getData();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondaryColor, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/appbar-logo.png',
              width: width * 0.2,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: categories.getCategoriesData == null
              ? Center(child: CircularProgressIndicator())
              : Consumer<GetCategories>(
                builder: (ctx, categoriesProvider, _) {
                  return ListView.separated(

    itemBuilder: (context, index) {
                    return Container(


                      child: Column(
                      children: [
                      Card(
                        color: Colors.grey.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [CustomText(text: categoriesProvider.categoriesData.data[index].name, size: 18,),
                              Image.network(categoriesProvider.categoriesData.data[index].imagePath, width: 70,),],
                          ),
                        ),
                      )
    ],),
                    );
                },
    itemCount: categories.count,
    separatorBuilder: (BuildContext context, int index) {
    return SizedBox(
    height: 20,
    );
    },
              );
            },


        ),

    ));
  }
}

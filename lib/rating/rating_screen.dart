import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/rating/rating_api.dart';
import 'package:shopy_now/widgets/custom_text.dart';

import '../constants.dart';

// ignore: must_be_immutable
class RatingScreen extends StatelessWidget {
  static const String id = 'RatingScreen';
  String rateId;
  RatingScreen(this.rateId);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var getAllRatings = Provider.of<GetRatingsApi>(context);
    getAllRatings.getData(rateId);
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
        child: getAllRatings.getProductData == null
            ? Center(child: CircularProgressIndicator())
            : Consumer<GetRatingsApi>(
          builder: (ctx, ratingsProvider, _) {
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
                            children: [
                              CustomText(text: ratingsProvider.productsRating.data[index].name, size: 18,),
                              CustomText(text: ratingsProvider.productsRating.data[index].rate, size: 18,),],
                          ),
                        ),
                      )
                    ],),
                );
              },
              itemCount: getAllRatings.count,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20,
                );
              },
            );
          },


        ),

      )
    );

  }
}

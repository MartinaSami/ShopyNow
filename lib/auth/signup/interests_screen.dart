import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopy_now/main.dart';
import 'package:shopy_now/widgets/custom_button.dart';
import 'package:shopy_now/widgets/custom_text.dart';
import 'package:shopy_now/widgets/interest_button.dart';

class InterestScreen extends StatelessWidget {
  static const String id = 'InterestScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            CustomText(
              text: 'اي هي اهتماماتك؟',
              size: 24,
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InterestButton(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            CustomButton(
              text: 'استكمال',
              onClick: () {
                Navigator.pushNamed(context, MyHomePage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

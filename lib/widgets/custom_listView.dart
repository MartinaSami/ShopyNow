import 'package:flutter/material.dart';
import 'package:shopy_now/widgets/custom_text.dart';

// ignore: must_be_immutable
class CustomListView extends StatelessWidget {
  @required
  String text;

  @required
  Function onTap;

  CustomListView({@required this.text, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: text,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        ],
      ),
    );
  }
}

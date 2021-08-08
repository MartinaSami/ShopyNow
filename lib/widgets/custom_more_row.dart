import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class CustomMoreRow extends StatelessWidget {
  final String name;
  final Function onClick;
  CustomMoreRow({@required this.name, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
        bottom: 15,
      ),
      child: InkWell(
        onTap: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: name,
              color: secondaryColor,
              size: 15,
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 15,
              color: secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

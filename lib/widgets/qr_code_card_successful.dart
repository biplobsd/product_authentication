import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:product_authentication/config/strings.dart';

class Successful extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(128)),
                child: Container(
                    decoration: BoxDecoration(
                        // color: generateMaterialColor(Palette.primary)[300],
                        // border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(128))),
                    width: 120,
                    height: 120,
                    child: Lottie.asset('assets/verify_success.json',
                        repeat: false)
                    // Image(
                    //   image: AssetImage(
                    //     "assets/verify_success.png",
                    //   ),
                    // ),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings["verifed"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings["productInfo"],
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings["EDITION"],
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 10,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
          ],
        ),
      ),
    );
  }
}

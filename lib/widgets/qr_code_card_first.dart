import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:product_authentication/bloc/qrbloc_bloc.dart';
import 'package:product_authentication/config/theme_config/pallete.dart';

class FirstFound extends StatelessWidget {
  final QRInstanceState state;
  final String verfiyString;
  const FirstFound(
    this.state,
    this.verfiyString, {
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Scan second QR code",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: generateMaterialColor(Colors.greenAccent)[100],
                      // border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Lottie.asset('assets/progress_bar.json',
                          repeat: true,
                          width: double.infinity,
                          height: 30,
                          fit: BoxFit.fill),
                      Image(
                        image: AssetImage(
                          "assets/verify_done.png",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 6, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: generateMaterialColor(
                                      Colors.blueAccent)[100],
                                  // border: Border.all(color: Colors.white, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  verfiyString,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: generateMaterialColor(
                                        Colors.blueAccent)[100],
                                    // border: Border.all(color: Colors.white, width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "=",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      generateMaterialColor(Colors.grey)[100],
                                  // border: Border.all(color: Colors.white, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  verfiyString,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.all(5),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "First verfiy code",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.code.qrString.toString(),
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

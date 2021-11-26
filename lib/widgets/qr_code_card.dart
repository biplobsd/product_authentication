import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_authentication/oparation/is_okay.dart';
import 'package:product_authentication/widgets/qr_code_card_first.dart';
import 'package:product_authentication/widgets/qr_code_card_invalid.dart';
import 'package:product_authentication/widgets/qr_code_card_placeholder.dart';
import 'package:product_authentication/bloc/qrbloc_bloc.dart';
import 'package:product_authentication/widgets/qr_code_card_successful.dart';

class QRCodeCard extends StatefulWidget {
  const QRCodeCard({Key key}) : super(key: key);

  @override
  _QRCodeCardState createState() => _QRCodeCardState();
}

class _QRCodeCardState extends State<QRCodeCard> {
  String firstString;
  String verfiyString;
  String nowInput;
  IsOkay checkCode = IsOkay();
  String inputCode;

  void resetVerifyState() {
    verfiyString = null;
    firstString = null;
  }

  @override
  Widget build(BuildContext context) {
    int mode;

    return BlocBuilder<QRBloc, QRState>(
      builder: (context, state) {
        if (state is QRInitial) {
          return QRCodePlaceholder();
        } else if (state is QRInstanceState) {
          mode = 3;
          inputCode = state.code.qrString.toString();
          if (checkCode.isValid(inputCode)) {
            nowInput = checkCode.secondString(inputCode);
            if (verfiyString == 'invalid') {
              mode = 3;
            } else if (firstString == null) {
              firstString = inputCode;
              verfiyString = nowInput;
              mode = 1;
            } else if (inputCode == firstString) {
              mode = 1;
            } else if (nowInput == verfiyString) {
              mode = 2;
            }
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: _build(state, context, mode),
            ),
          );
        } else {
          return Text("Oops! Something went wrong!");
        }
      },
    );
  }

  dynamic setHandelar(int mode, QRInstanceState state) {
    if (mode == 3) {
      // resetVerifyState();
      return Invalid();
    } else if (mode == 2) {
      return Successful();
    } else if (mode == 1) {
      return FirstFound(state, verfiyString);
    }
    resetVerifyState();
    return Text("Error!");
  }

  Widget _build(QRInstanceState state, BuildContext context, int mode) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 4.0,
      child: Stack(
        children: [
          setHandelar(mode, state),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: TextButton(
              style:
                  TextButton.styleFrom(primary: Theme.of(context).primaryColor),
              autofocus: false,
              onPressed: () {
                BlocProvider.of<QRBloc>(context).add(QRInit());
                resetVerifyState();
              },
              child: Icon(Icons.clear),
            ),
          ),
        ],
      ),
    );
  }
}

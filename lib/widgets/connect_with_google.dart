import 'package:flutter/material.dart';

class ConnectWithGoogle extends StatelessWidget {
  const ConnectWithGoogle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(233, 234, 243, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // <-- Radius
          ),
        ),
        onPressed: () async {},
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Image.asset(
            'assets/images/google_icon.png',
            height: 18.0,
            width: 20.0,
          ),
          const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Continue with Google ",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),
              ))
        ]),
      ),
    );
  }
}


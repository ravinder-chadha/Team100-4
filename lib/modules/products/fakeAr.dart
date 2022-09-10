import 'package:flutter/material.dart';

class FakeAR extends StatefulWidget {
  const FakeAR({Key? key}) : super(key: key);

  @override
  State<FakeAR> createState() => _FakeARState();
}

class _FakeARState extends State<FakeAR> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: const Image(image: AssetImage("assets/images/DeepAR.gif"), fit: BoxFit.cover),
    );
  }
}

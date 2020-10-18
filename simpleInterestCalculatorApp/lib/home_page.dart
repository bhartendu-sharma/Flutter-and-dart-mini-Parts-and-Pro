import 'package:flutter/material.dart';
import './s_i_calc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple interest Calculator"),
        centerTitle: true,
      ),
      body: SiCalc(),
    );
  }
}

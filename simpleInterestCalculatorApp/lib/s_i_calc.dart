import 'package:flutter/material.dart';

class SiCalc extends StatefulWidget {
  @override
  _SiCalcState createState() => _SiCalcState();
}

class _SiCalcState extends State<SiCalc> {
  var _formKey = GlobalKey<FormState>();

  List<String> _currencies = ["Dollar", "Rupees", "Euro"];

  // String _currenItemSelected = "Rupees";
  String _currenItemSelected = "";
  // ***************** initState********************
  @override
  void initState() {
    super.initState();
    _currenItemSelected = _currencies[1];
  }
  // ****************************************

  Widget getFirstImage() {
    AssetImage aAssetImage = AssetImage("assets/images/money.jpg");
    Image iImage = Image(image: aAssetImage, width: 150.0, height: 150.0);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iImage,
        ],
      ),

      // margin: EdgeInsets.all(80),
    );
  }

  void _onDropDownItemSelected(newValueSelected) {
    setState(() {
      this._currenItemSelected = newValueSelected;
    });
  }

  TextEditingController _principleController = TextEditingController();
  TextEditingController _rateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  String displayInterest = "";
  String calculateInterest() {
    double p = double.parse(_principleController.text);
    double r = double.parse(_rateController.text);
    int t = int.parse(_timeController.text);
    double interest = (p * r * t) / (100 * 12);
    return "Your interest after $t month is $interest $_currenItemSelected ";
  }

  void resetAllParts() {
    _principleController.text = "";
    _rateController.text = "";
    _timeController.text = "";
    displayInterest = "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              getFirstImage(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter Principle amount";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Principle",
                      hintText: "Enter Principle e.g 1200",
                      errorStyle:
                          TextStyle(color: Colors.yellow[700], fontSize: 18.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  controller: _principleController,
                  // onSubmitted: (_) => submitData(_),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter rate";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Rate of interest",
                      hintText: "in percent",
                      errorStyle: TextStyle(
                        color: Colors.yellow[700],
                        fontSize: 18.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  controller: _rateController,
                  // onSubmitted: (_) => submitData(_),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter time";
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "time",
                            hintText: "in month",
                            errorStyle: TextStyle(
                                color: Colors.yellow[700], fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        controller: _timeController,
                        // onSubmitted: (_) => submitData(_),
                      ),
                    ),
                    Container(
                      width: 20.0,
                    ),
                    // SizedBox(
                    //   width: 20.0,
                    // ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 10.0,
                        margin: EdgeInsets.only(right: 20.0),
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.red, width: 2.0)),
                        child: DropdownButton<String>(
                            items: _currencies.map((e) {
                              return DropdownMenuItem<String>(
                                child: Text(e),
                                value: e,
                              );
                            }).toList(),
                            value: _currenItemSelected,
                            onChanged: (String newValueSelected) {
                              _onDropDownItemSelected(newValueSelected);
                            }),
                      ),
                    ),
                    // Expanded(flex: 1, child: Container())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        // onPressed: () => submitData,
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              this.displayInterest = calculateInterest();
                            }
                          });
                        },
                        child: Text("Calculate"),
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            resetAllParts();
                          });
                        },
                        child: Text("Reset"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.red, width: 2)),
                child: Text(
                  displayInterest,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )),
    );
  }
}

// import 'package:flutter/material.dart';

// class SiCalc extends StatefulWidget {
//   @override
//   _SiCalcState createState() => _SiCalcState();
// }

// class _SiCalcState extends State<SiCalc> {
//   List<String> _currencies = ["Dollar", "Rupees", "Euro"];
//   TextEditingController _principleController = TextEditingController();
//   TextEditingController _rateController = TextEditingController();
//   TextEditingController _timeController = TextEditingController();
//   // double interest = 0.0;
//   // void calculateInterest(double p, double r, int t) {
//   //   interest += (p * r * t) / (100 * 12);
//   //   print(p);
//   //   print(r);
//   //   print(t);
//   //   print(interest);
//   // }

//   // void submitData(String value) {
//   //   final enteredPrinciple = _principleController.text;
//   //   final enteredRate = _rateController.text;
//   //   final enteredTime = _timeController.text;
//   //   double p = double.parse(enteredPrinciple);
//   //   double r = double.parse(enteredRate);
//   //   int t = int.parse(enteredTime);
//   //   print(p);
//   //   // double interest = 0.0;
//   //   if (p <= 0 || r <= 0 || t <= 0) {
//   //     return;
//   //   }
//   //   calculateInterest(p, r, t);
//   // }
//   String displayInterest = "";
//   String calculateInterest() {
//     double p = double.parse(_principleController.text);
//     double r = double.parse(_rateController.text);
//     int t = int.parse(_timeController.text);
//     double interest = (p * r * t) / (100 * 12);
//     return "Your interest after $t month is $interest ";
//   }

//   void resetAllParts() {
//     _principleController.text = "";
//     _rateController.text = "";
//     _timeController.text = "";
//     displayInterest = "";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.all(10.0),
//         child: ListView(
//           children: [
//             getFirstImage(),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                     labelText: "Principle",
//                     hintText: "Enter Principle e.g 1200",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5.0))),
//                 controller: _principleController,
//                 // onSubmitted: (_) => submitData(_),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                     labelText: "Rate of interest",
//                     hintText: "in percent",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5.0))),
//                 controller: _rateController,
//                 // onSubmitted: (_) => submitData(_),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 3,
//                     child: TextField(
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                           labelText: "time",
//                           hintText: "in month",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5.0))),
//                       controller: _timeController,
//                       // onSubmitted: (_) => submitData(_),
//                     ),
//                   ),
//                   Container(
//                     width: 20.0,
//                   ),
//                   // SizedBox(
//                   //   width: 20.0,
//                   // ),
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       width: 10.0,
//                       margin: EdgeInsets.only(right: 20.0),
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.red, width: 2.0)),
//                       child: DropdownButton<String>(
//                           items: _currencies.map((e) {
//                             return DropdownMenuItem<String>(
//                               child: Text(e),
//                               value: e,
//                             );
//                           }).toList(),
//                           value: "Rupees",
//                           onChanged: (String newValueSelected) {}),
//                     ),
//                   ),
//                   // Expanded(flex: 1, child: Container())
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: RaisedButton(
//                       // onPressed: () => submitData,
//                       onPressed: () {
//                         setState(() {
//                           this.displayInterest = calculateInterest();
//                         });
//                       },
//                       child: Text("Calculate"),
//                     ),
//                   ),
//                   Expanded(
//                     child: RaisedButton(
//                       onPressed: () {
//                         setState(() {
//                           resetAllParts();
//                         });
//                       },
//                       child: Text("Reset"),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10.0),
//               // decoration: BoxDecoration(
//               //     border: Border.all(color: Colors.red, width: 2)),
//               child: Text(
//                 displayInterest,
//                 textAlign: TextAlign.center,
//               ),
//             )
//           ],
//         ));
//   }
// }

// Widget getFirstImage() {
//   AssetImage aAssetImage = AssetImage("assets/images/money.jpg");
//   Image iImage = Image(image: aAssetImage, width: 150.0, height: 150.0);
//   return Container(
//     margin: EdgeInsets.symmetric(vertical: 10.0),
//     width: double.infinity,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         iImage,
//       ],
//     ),

//     // margin: EdgeInsets.all(80),
//   );
// }

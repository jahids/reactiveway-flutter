// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:crudapp/Style/Style.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  final Logger logger = Logger();
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };

  // get data input

  InputOnChange(InputKey, inputValue) {
    setState(() {
      FormValues.update(InputKey, (value) => inputValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Product"),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: AppInputDecoration("Product Name"),
                    onChanged: (value) {
                      InputOnChange("ProductName", value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration("Product Code"),
                    onChanged: (value) {
                      InputOnChange("ProductCode", value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration("Product Image"),
                    onChanged: (value) {
                      InputOnChange("Img", value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration("Product Unit Price"),
                    onChanged: (inputValue) {
                      InputOnChange("UnitPrice", inputValue);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration("Product Total Price"),
                    onChanged: (inputValue) {
                      InputOnChange("TotalPrice", inputValue);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AppDropDownStyle(DropdownButton(
                      value: FormValues['Qty'],
                      // value: FormValues["Qty"],
                      underline: Container(),
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Select qt"),
                          value: "",
                        ),
                        DropdownMenuItem(
                          child: Text("1 pcs"),
                          value: "1 pcs",
                        ),
                        DropdownMenuItem(
                          child: Text("2 pcs"),
                          value: "2 pcs",
                        ),
                        DropdownMenuItem(
                          child: Text("3 pcs"),
                          value: "3 pcs",
                        ),
                        DropdownMenuItem(
                          child: Text("4 pcs"),
                          value: "4 pcs",
                        ),
                      ],
                      onChanged: (value) {
                        InputOnChange("Qty", value);
                      })),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: () {
                        // ignore: avoid_print
                        logger.i('FormValues: $FormValues');
                        // print(
                        //     "-->data ${FormValues.toString()}"); // This line will print FormValues
                      },
                      // child: Text("submit"),
                      child: SuccessButtonChild("submit"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    logger.d('Disposed');
    super.dispose();
  }
}

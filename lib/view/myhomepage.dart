import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/helper/constant.dart';
import 'package:flutter_application_1/services/quoteservices.dart';
import 'package:flutter_application_1/view/authorquoteui.dart';
import 'package:flutter_application_1/view/favouritequote.dart';
import 'package:flutter_application_1/view/searchquote.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Quote Mobile app"),
        backgroundColor: colorblue,
        elevation: 0,
      ),
      body: Container(
        color: colorblue,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: colorwhite,
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        
                        log("pressed");
                        Get.to(AuthorQuoteUI());
                      },
                      child: Text('Author quote'),
                      style: loginbuttonstyle),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(SearchQuoteUI());
                      },
                      child: Text('Search quote'),
                      style: loginbuttonstyle)
                ],
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(FavQuoteUI());
                  },
                  child: Text('Favourite quote'),
                  style: loginbuttonstyle)
            ],
          )),
        ),
      ),
    );
  }
}

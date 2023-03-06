import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/searchmodel.dart';
import 'package:flutter_application_1/services/helper/constant.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onchanged;
  final TextInputType? keyboardType;

  final String? hintText;
  const CustomTextField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.hintText,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: TextFormField(
        minLines: 1,
        keyboardType: keyboardType,
        controller: controller,
        // autofillHints: [AutofillHints.postalCode],

        decoration: InputDecoration(
          hintStyle: TextStyle(
              fontFamily: "productSansReg",
              color: colorblue,
              backgroundColor: colorwhite),
          hintText: hintText,
          floatingLabelStyle: TextStyle(
            color: colorblue,
            fontSize: 22,
          ),
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(17)),
              borderSide: BorderSide(color: colorblue)),
          filled: true,
          fillColor: colorwhite,
        ),
        style: TextStyle(fontFamily: "googlesansreg"),
        cursorColor: colorblue,
        cursorHeight: 24,
        onChanged: onchanged,
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final String name;
  final String quote;
  const QuoteCard({super.key, required this.name, required this.quote});

  @override
  Widget build(BuildContext context) {
    TextStyle KeyValueStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
    double space = 4;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0.6,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${name}",
                        style: TextStyle(
                            color: colorblue,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                    SizedBox(
                      height: space * 2,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.height * 0.39,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              quote.toString(),
                              style: KeyValueStyle,
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: space),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

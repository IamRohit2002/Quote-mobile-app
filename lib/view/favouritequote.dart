import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/services/helper/constant.dart';
import 'package:flutter_application_1/services/widgets.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class FavQuoteUI extends StatefulWidget {
  const FavQuoteUI({super.key});

  @override
  State<FavQuoteUI> createState() => _FavQuoteUIState();
}

class _FavQuoteUIState extends State<FavQuoteUI> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: Text("Favourite quote"),
          backgroundColor: colorblue,
          elevation: 0,
          // bottom: PreferredSize(
          //   preferredSize: Size.fromHeight(50),
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 10),
          //     child: CustomTextField(
          //       controller: authorController,
          //       keyboardType: TextInputType.name,
          //       hintText: "Author quote",
          //     ),
          //   ),
          // ),
        ),
        body: Container(
          color: colorwhite,
          child: Center(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return FavList();
                  })),
        ),
      ),
    );
  }

  Widget FavList() {
    double space = 4;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        elevation: 0.6,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text("Rehana Mahat",
                //         style: TextStyle(
                //             fontWeight: FontWeight.w500, fontSize: 20)),
                //     SizedBox(
                //       height: space * 2,
                //     ),
                //     LeftRightContentWidget(
                //       leftString: "Item Discription",
                //       rightString: "Rehana",
                //     ),
                //     SizedBox(height: space),
                //     LeftRightContentWidget(
                //         leftString: "Item Discription", rightString: "Rehana"),
                //     SizedBox(height: space),
                //     LeftRightContentWidget(
                //         leftString: "Item Discription", rightString: "Rehana"),
                //     SizedBox(height: space),
                //     LeftRightContentWidget(
                //         leftString: "Item Discription", rightString: "Rehana")
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

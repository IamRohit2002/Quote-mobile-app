import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/searchmodel.dart';

import 'package:flutter_application_1/services/helper/constant.dart';
import 'package:flutter_application_1/services/quoteservices.dart';
import 'package:flutter_application_1/services/widgets.dart';
import 'package:get/get.dart';

class AuthorQuoteUI extends StatefulWidget {
  const AuthorQuoteUI({super.key});

  @override
  State<AuthorQuoteUI> createState() => _AuthorQuoteUIState();
}

TextEditingController authorController = TextEditingController();
bool isLoading = false;
List<SearchModel> namelist = [];
String searchQuery = '';
// TextEditingController pretext = TextEditingController();

class _AuthorQuoteUIState extends State<AuthorQuoteUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    await QuoteService()
        .searchQuotes(authorController.text.toString())
        .then((value) {
      namelist = value;
    });
    setState(() {
      isLoading = false;
    });
  }

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
          title: Text("Author quote"),
          backgroundColor: colorblue,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomTextField(
                onchanged: (value) {
                  getData();
                },
                controller: authorController,
                keyboardType: TextInputType.name,
                hintText: "Search Author quote",
              ),
            ),
          ),
        ),
        body: namelist.isEmpty
            ? Container(
                child: Center(child: Text("Search the name of author")),
              )
            : Container(
                color: colorwhite,
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return QuoteCard(
                                name: namelist[index].author.toString(),
                                quote: namelist[index].content.toString(),
                              );
                            })),
              ),
      ),
    );
  }

  // void dosearch(String newQuery) {
  //   setState(() {
  //     searchQuery = newQuery;
  //     namelist = namelist
  //         .where((element) => element.
  //             .toString()
  //             .toLowerCase()
  //             .contains(newQuery.toLowerCase()))
  //         .toList();
  //     if (newQuery == '' || newQuery.isEmpty) {
  //       namelist = namelist.where((element) => element.name != null).toList();
  //     }
  //   });
  // }
}

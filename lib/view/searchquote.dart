import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/searchmodel.dart';
import 'package:flutter_application_1/services/helper/constant.dart';
import 'package:flutter_application_1/services/quoteservices.dart';
import 'package:flutter_application_1/services/widgets.dart';

import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class SearchQuoteUI extends StatefulWidget {
  const SearchQuoteUI({super.key});

  @override
  State<SearchQuoteUI> createState() => _SearchQuoteUIState();
}

List<SearchModel> namelist = [];
TextEditingController searchController = TextEditingController();
bool isLoading = false;

class _SearchQuoteUIState extends State<SearchQuoteUI> {
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    await QuoteService().searchQuotesdiff(searchController.text).then((value) {
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
          title: Text("Search quote by tag"),
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
                controller: searchController,
                keyboardType: TextInputType.name,
                hintText: "Search quote",
              ),
            ),
          ),
        ),
        body: Container(
          color: colorwhite,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Total results ${namelist.length}",
                        style: TextStyle(fontSize: 18),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: namelist.length,
                          itemBuilder: (context, index) {
                            return QuoteCard(
                              name: namelist[index].author.toString(),
                              quote: namelist[index].content.toString(),
                            );
                          }),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

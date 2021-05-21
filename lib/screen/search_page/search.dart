import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/data/list_data.dart';
import 'package:sellbag/model/item.dart';
import 'package:sellbag/screen/search_page/components/search_bar.dart';
import 'package:sellbag/screen/search_page/components/search_categories.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Data> search = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      search = searchcategorieslistdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 15),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: secondarycolor,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Expanded(
                        child: SearchBar(title: 'Search'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                    bottom: 8,
                  ),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      padding: const EdgeInsets.all(10),
                      children: search.map((Data searchcategoriesdata) {
                        return SearchCategories(
                          searchcategoriesdata: searchcategoriesdata,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

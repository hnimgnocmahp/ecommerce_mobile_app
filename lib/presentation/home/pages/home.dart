import 'package:ecommerce_mobile_app/common/widgets/appbar/home_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  final SearchController searchController = SearchController();
  final List<String> items = ['Apple', 'Banana', 'Mango', 'Orange', 'Grapes'];

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(),
        body: Column(
          children: [
            _searchBar()
          ],
      
        ),
        // bottomNavigationBar: ,
      ),
    );
  }

  Widget _searchBar(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SearchAnchor.bar(
        searchController: searchController,
        barHintText: 'Search.',
        suggestionsBuilder: (context, controller) {
          final query = controller.text.toLowerCase();
          final suggestions = items
              .where((item) => item.toLowerCase().contains(query))
              .map((item) => ListTile(
            title: Text(item),
            onTap: () {
              controller.closeView(item);
            },
          ))
              .toList();
          return suggestions;
        },
      ),
    );
  }

}
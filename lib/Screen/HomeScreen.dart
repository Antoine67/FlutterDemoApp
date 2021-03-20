import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phone_devalgo/UI/ArticleCard.dart';
import 'package:phone_devalgo/UI/Article.dart';


class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => new _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen>  {

 @override
 bool get wantKeepAlive => true;

var articlesData = []; //ArticleData.getData; @override //Read from file
ScrollController _scrollController = new ScrollController();

@override
void initState() {
  super.initState();
  fetchAmount(10);//Init view with 10 articles

  _scrollController.addListener(() {
    if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent-30) {
      fetchAmount(4); // Add 4 articles when user is almost at the end of the scroll
    }
  });
}

@override
void dispose() {
  _scrollController.dispose();
  super.dispose();
}

Widget build(BuildContext context) {
  super.build(context);
  Size screenSize = MediaQuery.of(context).size;

  return Container(
    color: Colors.grey[100],
    child: ListView.builder(
      controller : _scrollController,
      itemCount: articlesData.length~/2,
      itemBuilder: (context, index) {
          return _productsList(index);
      },
    ),
  );
}

_productsList(int index)  {
  int realArticleNb = index * 2;
  return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new ArticleCard(articlesData[realArticleNb]),
        new ArticleCard(articlesData[realArticleNb + 1]),
      ],
    );
  }

 

fetch(int i) async {
  final response = await http.get("https://jsonplaceholder.typicode.com/photos/" +i.toString());
  if(response.statusCode == 200) {
    setState(() { //Update list, and refresh view
      var d = json.decode(response.body);
      var article = new Article(
                        image: d['url'],
                        id: i,
                        name: "uuuu", //d['title'],
                        price: 550.0,
                        category: 'Iphone',
                        description: 'Pas cher',
                    );
      articlesData.add(article);
    });

  }else {
    throw Exception ("Failed to load image with id " + i.toString());
  }
}

/// Add a given amount of article to article list
fetchAmount(int amount) {
  for(int i=1; i<amount+1; i++) {
    fetch(i);
  }
}


}

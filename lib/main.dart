import 'package:flutter/material.dart';
import 'package:phone_devalgo/Screen/HomeScreen.dart';

import 'Screen/ProfileScreen.dart';
import 'Screen/SearchScreen.dart';
import 'Screen/SellScreen.dart';
import 'Utils/routes.dart';

void main() => runApp(MyApp());

//Icons : https://material.io/resources/icons/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return new MaterialApp(
      routes: Routes.routes,
      color: Colors.white,
      home: DefaultTabController(
        length: 4,
        child: new Scaffold(
          body: TabBarView(
            //physics: NeverScrollableScrollPhysics(), //Disable swipe between tabs
            children: [
              new Container(
                child: new HomeScreen(),
              ),
              new Container(
                child: new SearchScreen(),
              ),
              new Container(
                child: new SellScreen(),
              ),
              new Container(
                child: new ProfileScreen(),
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(Icons.search),
              ),
              Tab(
                icon: new Icon(Icons.add_circle_outline),
              ),
              Tab(
                icon: new Icon(Icons.perm_identity),
              ),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.blue,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

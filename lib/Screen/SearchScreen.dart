import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  _SearchScreenState createState() => new _SearchScreenState();

}

class _SearchScreenState extends State<SearchScreen> with AutomaticKeepAliveClientMixin<SearchScreen>  {

TextEditingController editingController = TextEditingController();

  @override
  bool get wantKeepAlive => true;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  Widget build(BuildContext context) {
    super.build(context);
    return new TextField(
      controller: editingController,
      decoration: InputDecoration(
          labelText: "Rechercher un téléphone",
          hintText: "IPhone X, ...",
          prefixIcon: Icon(Icons.search),
      )
    );
  }
}
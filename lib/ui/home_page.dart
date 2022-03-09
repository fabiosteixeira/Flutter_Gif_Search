import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _search;
  final int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null) {
      response = await http.get(
        Uri.parse(
            "https://api.giphy.com/v1/gifs/trending?api_key=t1EaWQ7sIWXuEF5fje8mG4GuzFxsU2Ws&limit=20&rating=g"),
      );
    } else {
      response = await http.get(
        Uri.parse(
            "https://api.giphy.com/v1/gifs/search?api_key=t1EaWQ7sIWXuEF5fje8mG4GuzFxsU2Ws&q=$_search&limit=20&offset=$_offset&rating=g&lang=en"),
      );
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  var isLoaded = false;
  var jsonData;
  var userID, title, completed;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Data Application", style: TextStyle(fontSize: 20)),
          centerTitle: true,
          leading: Icon(Icons.arrow_back),
        ),
        body: !isLoaded
            ? Center(child: CircularProgressIndicator())
            : Container(
                color: Colors.white,
                child: ListView.builder(
                    itemCount: jsonData.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 15,
                        shadowColor: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Id"),
                                Text(userID.toString().isEmpty
                                    ? "loading..."
                                    : jsonData[i]['id'].toString())
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Title"),
                                Text(title.toString().isEmpty
                                    ? "loading..."
                                    : jsonData[i]['title'])
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Status"),
                                Text(completed.toString().isEmpty
                                    ? "loading..."
                                    : jsonData[i]['completed'].toString())
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ));
  }

  Future<void> getData() async {
    var response =
        await http.get("https://jsonplaceholder.typicode.com/todos/");
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      setState(() {
        jsonData = jsonResponse;
        isLoaded = true;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

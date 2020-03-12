import 'package:animated_card/animated_card.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Eventimages.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listviews"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return  AnimatedCard(
            direction: AnimatedCardDirection.right,
            //Initial animation direction
            initDelay: Duration(milliseconds: 0),
            //Delay to initial animation
            duration: Duration(seconds: 2),
            //Implement this action to active dismiss
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    String event_title = data[index]["title"];
                    int event_no_of_images = data[index]["id"];
                    String eve = data[index]["title"];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Eventimages(event_title,event_no_of_images),
                        ));
                  },
                  child: Card(

                    color: Colors.lightGreenAccent,
                    elevation: 5,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 150,
                          child: Center(child: Text(data[index]["title"])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 250,
                            bottom: 10,
                          ),
                          child: Container(child: Text("Photos: " + data[index]["id"].toString())),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
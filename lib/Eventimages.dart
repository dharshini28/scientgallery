import 'package:flutter/material.dart' ;
import 'Imagezoom.dart';
void main() => runApp(MyApp());

class Eventimages extends StatefulWidget {
  String event_title;
  int event_no_of_images;
  Eventimages(this.event_title,this.event_no_of_images );
  @override
  State<StatefulWidget> createState() {
  return Projectsyearstate(this.event_title,this.event_no_of_images );
  }}
  class Projectsyearstate extends State<Eventimages> {
  String event_title;
  int event_no_of_images;
  Projectsyearstate(this.event_title,this.event_no_of_images );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(event_no_of_images, (index) {
            return Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Imagezoom(),
                      ));
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage(
                        "assets/images/image1.jpg",
                      ),
                    ),
                  ),),
              ),);}),),),);}}


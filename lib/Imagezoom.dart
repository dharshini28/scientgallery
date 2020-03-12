import 'package:flutter/material.dart' ;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Animated Card Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Imagezoom(),
    );
  }
}
  class Imagezoom extends StatefulWidget {
  @override
  _GalleryExampleState createState() => _GalleryExampleState();
  }

  class _GalleryExampleState extends State<Imagezoom> {
  bool verticalGallery = false;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body:Container(
  decoration: BoxDecoration(
  image: DecorationImage(
  image: new AssetImage(
  "assets/images/image1.jpg",
  ),
  )
  ),),);}}

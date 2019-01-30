import 'package:flutter/material.dart';
import 'package:Liste/screens/getMyList.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  
  @override
  Widget build(BuildContext context) {
    return GetMyList();
  }
  
}
import '../screen/home/HomeScreen.dart';
import 'package:flutter/material.dart';
class AppRoutes
{
  static Map<String, Widget Function(BuildContext)>  routes = {
    '/':(context)=>HomeScreen(),
  };
}
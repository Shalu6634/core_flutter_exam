import 'package:core_flutter_exam/screen/home/addDetailScreen.dart';

import '../screen/home/HomeScreen.dart';
import 'package:flutter/material.dart';
class AppRoutes
{
  static Map<String, Widget Function(BuildContext)>  routes = {
    '/':(context)=>HomeScreen(),
    '/home':(context)=>AddStudent(),

  };
}
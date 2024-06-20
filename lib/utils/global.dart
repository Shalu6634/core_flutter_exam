
import 'dart:io';

import 'package:flutter/material.dart';
TextEditingController txtName = TextEditingController();
TextEditingController txtGrid = TextEditingController();
TextEditingController txtStandard = TextEditingController();

List studentList = [];

class StudentModel
{
  TextEditingController? name;
  TextEditingController? grid;
  TextEditingController? standard;

  File? img ;
  StudentModel( {this.img,this.grid,this.name,this.standard});
}

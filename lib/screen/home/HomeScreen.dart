import 'dart:async';
import 'dart:io';

import 'package:core_flutter_exam/utils/global.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/modelClass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

ImagePicker imagePicker = ImagePicker();
File? img;
int select=0;
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(onTap: (){

            Navigator.of(context).pushNamed('/home');
          },child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_forward),
          ))],
        title: Text('student'),
        elevation: 8,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            ...List.generate(
              studentList.length,
              (index) =>Column(
                children: [
                  buildSizedBox('Name' ,studentList[index].name, ),
                  buildSizedBox('GRID' ,studentList[index].grid, ),
                  buildSizedBox('Standard',studentList[index].standard, ),
                  Row(children: [
                    IconButton(onPressed: (){
                      setState(() {
                        studentList.removeAt(index);
                      });
                    }, icon: Icon(Icons.delete))
                  ],),
                  Row(
                    children: [
                      studentList[index].img == null?
                        CircleAvatar(
                          radius: 50,
                        )  :
                          CircleAvatar(
                            radius: 50,
                              backgroundImage: studentList[index].img!=null?FileImage(studentList[index].img!):null,
                          ),
                      IconButton(onPressed: () async {

                        XFile? img = await imagePicker.pickImage(source: ImageSource.gallery);

                        setState(() {
                          studentList[index].img = File(img!.path);
                        });
                      }, icon: Icon(Icons.image)),
                    ],
                  )
                ],


              )
            ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController txtName = TextEditingController();
          TextEditingController txtGrid = TextEditingController();
          TextEditingController txtStandard = TextEditingController();
          setState(() {
            studentList.add(StudentModel(
              name: txtName,
              grid: txtGrid,
              standard: txtStandard,

            ));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildSizedBox(String title,TextEditingController controller, ) {
    return SizedBox(
      width: 300,
      height: 100,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
            focusedBorder: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder()),
      ),
    );
  }
}

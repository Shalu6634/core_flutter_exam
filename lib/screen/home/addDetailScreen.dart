import 'dart:io';
import 'package:core_flutter_exam/utils/global.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'HomeScreen.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(onTap: (){
              setState(() {

              });
              Navigator.of(context).pushNamed('/edit');
            },
              child: Container(
                height: 100,
                width: 320,
                decoration: BoxDecoration(color: Colors.blue.shade50),
                child: Row(
                  children: [
                    ...List.generate(
                      studentList.length,
                      (index) => Row(
                        children: [
                          studentList[index].img == null
                              ? CircleAvatar(
                                  radius: 50,
                                )
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundImage: studentList[index].img != null
                                      ? FileImage(studentList[index].img!)
                                      : null,
                                ),
                          IconButton(
                              onPressed: () async {
                                XFile? img = await imagePicker.pickImage(
                                    source: ImageSource.gallery);

                                setState(() {
                                  studentList[index].img = File(img!.path);
                                });
                              },
                              icon: Icon(Icons.image)),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('Name : '),
                                  Text('${studentList[index].name!.text}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('GRID : '),
                                  Text(studentList[index].grid!.text),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Standard : '),
                                  Text(studentList[index].standard!.text),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            studentList.removeAt(index);
                                          });
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => const  SingleChildScrollView(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                              AlertDialog(

                                              content: const SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[

                                              SizedBox(
                                                width: 300,
                                                height: 100,
                                                child: TextField(

                                                  decoration: InputDecoration(

                                                      focusedBorder: OutlineInputBorder(),
                                                      enabledBorder: OutlineInputBorder()),
                                                ),
                                              ),
                                                    SizedBox(
                                                      width: 300,
                                                      height: 100,
                                                      child: TextField(

                                                        decoration: InputDecoration(

                                                            focusedBorder: OutlineInputBorder(),
                                                            enabledBorder: OutlineInputBorder()),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 300,
                                                      height: 100,
                                                      child: TextField(

                                                        decoration: InputDecoration(

                                                            focusedBorder: OutlineInputBorder(),
                                                            enabledBorder: OutlineInputBorder()),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(Icons.edit))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

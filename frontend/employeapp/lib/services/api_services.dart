import 'dart:convert';

import 'package:employeapp/model/employe.dart';
import 'package:employeapp/pages/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:image_picker/image_picker.dart';

class ApiService{
  
  static Future<List<EmployeModel>?> getData() async {
    try {
       var response = await http.get(Uri.parse("http://192.168.100.5/backend/action/read.php"));
    if (response.statusCode == 200) {
      final parsed = response.body;
      return employeFromJson(parsed);
      
    }else{
      throw Exception("failed");
    }
    } catch (e) {
     print(e.toString()); 
    }
  }

  Future<List<EmployeModel>?> loadData() async {
    try {
       var response = await http.get(Uri.parse("http://192.168.100.5/backend/action/read.php"));
    if (response.statusCode == 200) {
      final parsed = response.body;
      return employeFromJson(parsed);
      
    }else{
      throw Exception("failed");
    }
    } catch (e) {
     print(e.toString()); 
    }
  }

  static Future<List<EmployeModel>?> getDataByNip(String nip) async {
    try {
      var response = await http.get(Uri.parse("http://192.168.100.5/backend/action/read.php?$nip"));
      if (response.statusCode == 200) {
        final parsed = response.body;
        return employeFromJson(parsed);
      }else{
        throw Exception("Failed To Get Data");
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<EmployeModel>?> deleteData(String nip) async{
    try {
      var response = await http.delete(Uri.parse("http://192.168.100.5/backend/action/delete.php?nip=$nip"));
    if (response.statusCode == 200) {
      print("Delete Success");
    }else{
      print("Failed Delete ${nip}");
      throw Exception("Failed");
    }
    } catch (e) {
     print(e); 
    }
  }


  static Future<List<EmployeModel>?> updateData(String id,String name,String nip, String division, String level,String pob, String bod, String phone, String email, String address) async {
    try {
      var response = await http.post(Uri.parse("http://192.168.100.5/backend/action/update.php?id=$id"),body: {
        'name':name,
        'nip':nip,
        'division':division,
        'level':level,
        'pob':pob,
        "bod":bod,
        "phone":phone,
        "email":email,
        "address":address

      });
    if (response.statusCode == 200) {
      print("Sukses Edit");
    }else{
      print("Error: ");
      throw Exception("Failed");
    }
    } catch (e) {
     print(e); 
    }  
  }


  static Future login(String username, String password) async {
    var response = await http.post(Uri.parse("http://192.168.100.5/backend/action/login.php"),body:{
      'username':username,
      'password':password,
    });
    if (response.statusCode == 200) {
      var res = response.body;
      var json = jsonDecode(res);
      print(json[0]);
      if (json['message']=="Failed") {
        Get.snackbar('Error', 'Username or Password Wrong !',backgroundColor: Colors.red,colorText:Colors.white);
      }else{
        Get.snackbar('Success', 'Login Success',backgroundColor: Colors.green,colorText:Colors.white);
        Get.to(MainPage());
      }
      
    }
  }

}
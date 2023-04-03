import 'dart:convert';
import 'dart:io';
import 'package:employeapp/cons/cons.dart';
import 'package:http/http.dart' as http;
import 'package:employeapp/model/employe.dart';
import 'package:employeapp/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EmployeController extends GetxController{
  static const ADD_CATEGORY_URL='';
  String urlPost ='http://192.168.100.5:8080/api/employes/store';
  String? imageName;
  String? imageData;
  String? length;
  String imageUrl='';
  File? imagePath;
  var dataEmploye = <EmployeModel>[].obs;
  EmployeModel? employeModel;
  var dataLogin = ''.obs;
  var isLoading=true.obs;
   var imgPath=''.obs;

  String id = '';
  String nip = '';
  TextEditingController idC     = TextEditingController();
  TextEditingController nameC   = TextEditingController();
  TextEditingController nipC    = TextEditingController();
  TextEditingController divC    = TextEditingController();
  TextEditingController levC    = TextEditingController();
  TextEditingController pobC    = TextEditingController();
  TextEditingController bodC    = TextEditingController();
  TextEditingController phoneC  = TextEditingController();
  TextEditingController emailC  = TextEditingController();
  TextEditingController addressC= TextEditingController();

  TextEditingController eidC     = TextEditingController();
  TextEditingController enameC   = TextEditingController();
  TextEditingController enipC    = TextEditingController();
  TextEditingController edivC    = TextEditingController();
  TextEditingController elevC    = TextEditingController();
  TextEditingController epobC    = TextEditingController();
  TextEditingController ebodC    = TextEditingController();
  TextEditingController ephoneC  = TextEditingController();
  TextEditingController eemailC  = TextEditingController();
  TextEditingController eaddressC= TextEditingController();
  
  TextEditingController uC  = TextEditingController();
  TextEditingController pC= TextEditingController();


   Future getImage() async{
    try{
      isLoading(true);
        var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        imagePath = File(image.path);
        imageName = image.path.split('/').last;
        imageData = base64Encode(imagePath!.readAsBytesSync());
       
        
       
        if (image != null) {
          imgPath.value = image.path;
        }else{
          Get.snackbar('Picture Empty', 'Please Choose Picture');
        }
        return imageData
        //imageName = image.path.split('/').last;
        //imageData=base64Encode(imgPath.readAsBytesSync());
  
        
        ;
       }on PlatformException catch(e){
        print("Failed To Pick Image: $e");
       }
       isLoading(false);
  }
   
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void validateAndSave() {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }


  Future post() async{
   
   try {
     var request = await http.MultipartRequest('POST',Uri.parse("http://192.168.100.5/backend/action/insert.php"));
    request.fields['name'] = nameC.text;
      request.fields['nip']= nipC.text;
      request.fields['division']= divC.text;
      request.fields['level']=levC.text;
      request.fields['pob']=pobC.text;
      request.fields['bod']=bodC.text;
      request.fields['phone']=phoneC.text;
      request.fields['email']=emailC.text; 
      request.fields['address']=addressC.text;
      var pic = await http.MultipartFile.fromPath('photo',imgPath.value);
      request.files.add(pic);
      var response = await request.send();
      if (response.statusCode==200) {
        Get.snackbar(
          'Success',
           'Data Has Been Added',
           backgroundColor: Colors.green,
           colorText: Colors.white
           );
      }else{
        Get.snackbar('Failed',
         'Failed To Add Data',
         backgroundColor: Colors.red,
           colorText: Colors.white
         );
      }
   } finally {
     isLoading(false);
   } 
  }   


@override
  void onInit(){
    getData();
    getDataByNip();
    deleteData(nip);
    super.onInit();
  }

  void getData() async {
       try {
         isLoading(true);
      var dataTemp = await ApiService.getData();
      if (dataTemp != null) {
        dataEmploye(dataTemp);
      }
       } finally {
         isLoading(false);
       }
      
     isLoading(false);
  }

  void getDataByNip() async {
    isLoading(true);
    var dataTemp = await ApiService.getDataByNip(nip);
    if (dataTemp != null) {
      dataEmploye(dataTemp);  
    }
    isLoading(false);
  }

  void deleteData(String nip) async{
    isLoading(true);
    var dataTemp = await ApiService.deleteData(nip);
    if (dataTemp != null) {
      dataEmploye(dataTemp);
    }
    isLoading(false);
  }
  

    void postUpdate() async {
      try {
         isLoading(true);
      var postTemp = await ApiService.updateData(eidC.text,enameC.text,enipC.text,edivC.text,elevC.text,epobC.text,ebodC.text,ephoneC.text,eemailC.text,eaddressC.text);
        if (postTemp == null) {
        print("Sukses");
      }else{
          print("failed");
      }
    } finally {
      isLoading(false);      
    }

    
     
    }

    void login() async{
      try {
          isLoading(true);
          var postTemp = await ApiService.login(uC.text, pC.text);
          
      } catch (e) {
        
      }
    }


  }

  
  
  

 
  

  
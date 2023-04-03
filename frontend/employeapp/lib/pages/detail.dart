import 'dart:io';

import 'package:employeapp/cons/cons.dart';
import 'package:employeapp/controllers/employe_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'mainpage.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
   _FormPageState(){
selectedLevel=level[0];
selectedDiv=div[0];
 
  }
  
  bool isMenuOpen = false;
  final div   = ['Finance','HR','IT','Sales','Production'];
  final level = ['Staff','Leader','SPV','Manager'];
  String? selectedLevel="";
  String? selectedDiv="";
  
  final EmployeController employeC = Get.put(EmployeController());
  File? image;
    Future pickImage() async {
       try{
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imgTemp = File(image.path);
        setState(()=> this.image = imgTemp);
       }on PlatformException catch(e){
        print("Failed To Pick Image: $e");
       }
      }
  TextEditingController nameC   = TextEditingController();
  TextEditingController nipC    = TextEditingController();
  TextEditingController divC    = TextEditingController();
  TextEditingController levC    = TextEditingController();
  TextEditingController pobC    = TextEditingController();
  TextEditingController bodC    = TextEditingController();
  TextEditingController phoneC  = TextEditingController();
  TextEditingController emailC  = TextEditingController();
  TextEditingController addressC= TextEditingController();
  TextEditingController photoC  = TextEditingController();

  


  @override
  Widget build(BuildContext context) {
       
    dynamic width = MediaQuery.of(context).size.width;
    dynamic height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:Container(
        width:double.infinity,
        height:height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.3,
                0.6,
                0.9,
              ],
              colors: [
                Cons.col.second,
                Cons.col.primary,
                Cons.col.third,
              ]
            )
          ),
          child:SafeArea(
            child: SingleChildScrollView(
              child: Obx(()=>employeC.dataEmploye.isEmpty ? Center(child:CircularProgressIndicator())
              :
              Form(
                key:employeC.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Padding(
                      padding:  EdgeInsets.only(left:width*0.015,top:height*0.015),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Details",
                          style:TextStyle(
                            fontSize:18,
                            fontWeight:FontWeight.bold,
                            color:Colors.white
                          )
                          ),
                          TextButton(
                            onPressed: ()async{
                              
                                 var nip = employeC.nip;
                              employeC.deleteData(employeC.nip);
                             
                                     Get.snackbar('Success', 'Data Has Been Delete !',backgroundColor: Colors.green,colorText:Colors.white); 
                                    Get.offAll(MainPage());
                                   
                                    
                             
                             
                            },
                            child:Text("Delete",style:TextStyle(fontSize:16,color:Colors.red,fontWeight:FontWeight.bold))
                          )
                        ],
                      ),
                    ),
                    Container(
                      width:double.infinity,
                      height:height*0.225,
                      child: Stack(
                        children: [
                          Center(
                            child:employeC.imgPath == '' ?  Container(
                              width:width*0.3,
                              height:height*0.3,
                              decoration:BoxDecoration(
                                shape:BoxShape.circle,
                                border: Border.all(color:Cons.col.third,width:4),
                                image: DecorationImage(image:NetworkImage("http://192.168.100.5/backend/action/photoDocs/"+employeC.imageUrl),fit:BoxFit.fill)
                              )
                              )
                              :
                               Container(
                              width:width*0.3,
                              height:height*0.3,
                              decoration:BoxDecoration(
                                shape:BoxShape.circle,
                                border: Border.all(color:Cons.col.third,width:4),
                                image: DecorationImage(image:FileImage(employeC.imagePath!),fit:BoxFit.fill)
                              ),
                              
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              employeC.getImage();
                              
                              },
                            child: Center(
                              child: Padding(
                                padding:  EdgeInsets.only(left:width*0.2,top:height*0.1),
                                child: Container(
                                  width:width*0.1,
                                  height:height*0.075,
                                  decoration:BoxDecoration(
                                    shape:BoxShape.circle,
                                    color:Cons.col.third
                                  ),
                                  child:Icon(Icons.add_a_photo,color:Colors.white)
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  Padding(
                              padding:  EdgeInsets.only(left:width*0.05,top:height*0.025),
                              child: Text("Name",
                              style:TextStyle(
                                fontSize:16,
                                fontWeight:FontWeight.w400,
                                color:Colors.white
                              )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:width*0.05,right:width*0.05),
                              child: TextFormField(
                                validator: (value)=>value!.isEmpty ? 'Please Fill This Field':null,
                                controller: employeC.enameC,
                                keyboardType: TextInputType.name,
                                style: TextStyle(
                                  color:Colors.white
                                ),
                                decoration:InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                  )
                                )
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:width*0.05,top:height*0.025),
                              child: Text("Nip",
                              style:TextStyle(
                                fontSize:16,
                                fontWeight:FontWeight.w400,
                                color:Colors.white
                              )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:width*0.05,right:width*0.05),
                              child: TextFormField(
                                validator: (value)=>value!.isEmpty ? 'Please Fill This Field':null,
                                controller: employeC.enipC,
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                  color:Colors.white
                                ),
                                decoration:InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                  )
                                )
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:width*0.05,top:height*0.025),
                              child: Text("Division",
                              style:TextStyle(
                                fontSize:16,
                                fontWeight:FontWeight.w400,
                                color:Colors.white
                              )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:width*0.05,right:width*0.05),
                              child: TextFormField(
                              validator: (value)=>value!.isEmpty ? 'Please Fill This Field':null,
                              controller: employeC.edivC,
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                color:Colors.white
                              ),
                              decoration:InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                )
                              )
                            ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:width*0.05,top:height*0.025),
                              child: Text("Level",
                              style:TextStyle(
                                fontSize:16,
                                fontWeight:FontWeight.w400,
                                color:Colors.white
                              )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:width*0.05,right:width*0.05),
                              child: TextFormField(
                              validator: (value)=>value!.isEmpty ? 'Please Fill This Field':null,
                              controller: employeC.elevC,
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                color:Colors.white
                              ),
                              decoration:InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                )
                              )
                            ),
                            ),
                            Padding(
                            padding:  EdgeInsets.only(left:width*0.05,top:height*0.025),
                            child: Text("Place Of Birth",
                            style:TextStyle(
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                              color:Colors.white
                            )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left:width*0.05,right:width*0.05),
                            child: TextFormField(
                              validator: (value)=>value!.isEmpty ? 'Please Fill This Field':null,
                              controller: employeC.epobC,
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                color:Colors.white
                              ),
                              decoration:InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                )
                              )
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left:width*0.05,top:height*0.025),
                            child: Text("Birth Of Date",
                            style:TextStyle(
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                              color:Colors.white
                            )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left:width*0.05,right:width*0.05),
                           child:TextFormField(
                            validator: (value)=>value!.isEmpty ? 'Please Fill This Field':null,
                              controller: employeC.ebodC,
                              style: TextStyle(
                                color:Colors.white
                              ),
                              decoration:InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                )
                              ),
                              onTap: ()async{
                                DateTime? picked = await showDatePicker(
                                context: context,
                                      initialDate: DateTime.now(),
                                        firstDate: DateTime(1975), 
                                        lastDate: DateTime(2025)
                                );
                                if(picked != null){
                                  setState(() {
                                    employeC.ebodC.text=DateFormat('yyyy-MM-dd').format(picked);
                                  });
                                }
                                },
                            ),
                            ),
                          
                          Padding(
                            padding:  EdgeInsets.only(left:width*0.05,top:height*0.025),
                            child: Text("Phone",
                            style:TextStyle(
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                              color:Colors.white
                            )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left:width*0.05,right:width*0.05),
                            child: TextFormField(
                              validator: (value)=>value!.isEmpty ? 'Please Fill This Field':null,
                              controller: employeC.ephoneC,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                color:Colors.white
                              ),
                              decoration:InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                )
                              )
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left:width*0.05,top:height*0.025),
                            child: Text("Email",
                            style:TextStyle(
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                              color:Colors.white
                            )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left:width*0.05,right:width*0.05,),
                            child: TextFormField(
                              validator: (value)=>value!.isEmpty ? 'Please Fill This Field':null,
                              controller: employeC.eemailC,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color:Colors.white,
                                fontWeight:FontWeight.bold,
                              ),
                              decoration:InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                )
                              )
                            ),
                          ),
                           Padding(
                            padding:  EdgeInsets.only(left:width*0.05,top:height*0.025),
                            child: Text("Address",
                            style:TextStyle(
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                              color:Colors.white
                            )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left:width*0.05,right:width*0.05,bottom:height*0.015),
                            child: TextFormField(
                              validator: (value)=>value!.isEmpty ? 'Please Fill This Field':null,
                              controller: employeC.eaddressC,
                              keyboardType: TextInputType.streetAddress,
                              style: TextStyle(
                                color:Colors.white,
                                fontWeight:FontWeight.bold,
                              ),
                              decoration:InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white.withOpacity(0.4),width:2)
                                )
                              )
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding:  EdgeInsets.only(top:height*0.025),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color:Color(0xffFFFFFF).withOpacity(0.2),width: 2)
                                  ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff652EC7).withOpacity(0.4)
                                  ),
                                  onPressed: ()async{
                                   employeC.postUpdate();
                                    Future.delayed(Duration(seconds:1),(){
                                      Get.snackbar('Success', 'Data Has Been Updated',backgroundColor: Colors.green,colorText:Colors.white);
                                    Get.offAll(MainPage());
                                    }
                                    );
                                   
                                    
                                  }, child: Padding(
                                    padding:  EdgeInsets.all(width*0.025),
                                    child: Text("Submit",style:TextStyle(fontSize:18)),
                                  )),
                              ),
                            ),
                          )
                     
              
              
                             ]
                ),
              )
              )
            ),
          )
      )
    );
  }
}
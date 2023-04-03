import 'dart:convert';
import 'dart:io';
import 'package:employeapp/controllers/employe_controller.dart';
import 'package:employeapp/pages/mainpage.dart';
import 'package:employeapp/services/api_services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:employeapp/cons/cons.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  _FormPageState(){
selectedLevel=level[0];
selectedDiv=div[0];
 
  }
  
  final div   = ['Finance','HR','IT','Sales','Production'];
  final level = ['Staff','Leader','SPV','Manager'];
  String? selectedLevel="";
  String? selectedDiv="";
  

  void _showdate(){
    showDatePicker(
      context: context,
       initialDate: DateTime.now(),
        firstDate: DateTime(1975), 
        lastDate: DateTime(2025));
  }
  
  
  final EmployeController employeC = Get.put(EmployeController());
  
  @override
  Widget build(BuildContext context) {
   DateTime? selectedDate;
    dynamic width = MediaQuery.of(context).size.width;
    dynamic height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:Obx(
        ()=>ListView(
          children:[ 
 Container(
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
              child: Form(
                key:employeC.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Padding(
                      padding:  EdgeInsets.only(left:width*0.015,top:height*0.015),
                      child: Text("Add Employee Data",
                      style:TextStyle(
                        fontSize:18,
                        fontWeight:FontWeight.bold,
                        color:Colors.white
                      )
                      ),
                    ),
                    Container(
                      width:double.infinity,
                      height:height*0.225,
                      child: Stack(
                        children: [
                          Center(
                            child:employeC.imgPath != '' ?  Container(
                              width:width*0.3,
                              height:height*0.3,
                              decoration:BoxDecoration(
                                shape:BoxShape.circle,
                                border: Border.all(color:Cons.col.third,width:4),
                                image: DecorationImage(image:FileImage(employeC.imagePath!),fit:BoxFit.fill)
                              )
                              )
                              :
                               Container(
                              width:width*0.3,
                              height:height*0.3,
                              decoration:BoxDecoration(
                                shape:BoxShape.circle,
                                border: Border.all(color:Cons.col.third,width:4)
                              ),
                              child:  Icon(Icons.person,size:width*0.1,color:Colors.white)
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
                                controller: employeC.nameC,
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
                                controller: employeC.nipC,
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
                              child: DropdownButton(
                                
                                icon:Icon(Icons.arrow_drop_down_circle,color:Colors.white),
                                dropdownColor: Cons.col.primary,
                                isExpanded: true,
                                underline: Container(height:height*0.0025,color:Colors.white),  
                                value:selectedDiv,
                                items:div.map((e) => DropdownMenuItem(child: Text(e,style:TextStyle(
                                  color:Colors.white,fontWeight:FontWeight.bold
                                )),value:e,)).toList() ,
                                 onChanged: (val){
                                  setState(() {
                                    selectedDiv = val as String;
                                  });
                                 }
                              )
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
                              child: DropdownButton(
                                icon:Icon(Icons.arrow_drop_down_circle,color:Colors.white),
                                dropdownColor: Cons.col.primary,
                                underline:Container(height:height*0.0025,color:Colors.white),
                                isExpanded: true,
                               // underline: Container(height:height*0.0025,color:Colors.white),  
                                value:selectedLevel,
                                items:level.map((e) => DropdownMenuItem(child: Text(e,style:TextStyle(
                                  color:Colors.white,fontWeight:FontWeight.bold
                                )),value:e,)).toList() ,
                                 onChanged: (val){
                                  setState(() {
                                    //selectedLevel = val as String;
                                    //employeC.levC=selectedLevel;
                                  });
                                 }
                              )
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
                              controller: employeC.pobC,
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
                              controller: employeC.bodC,
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
                                    employeC.bodC.text=DateFormat('yyyy-MM-dd').format(picked);
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
                              controller: employeC.phoneC,
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
                              controller: employeC.emailC,
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
                              controller: employeC.addressC,
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
                                  onPressed: (){
                                    setState(() {
                                      employeC.divC.text=selectedDiv.toString();
                                      employeC.levC.text=selectedLevel.toString();
                                      if (employeC.imagePath != null && employeC.formKey.currentState!.validate()) {
                                    employeC.post();
                                    Get.snackbar('Success', 'Data Has Been Added !',backgroundColor: Colors.green,colorText:Colors.white);
                                    
                                    Get.offAll(MainPage());
                                    
                                    
                                   }else{
                                    Get.snackbar('Error', 'Please Check Form Field !');
                                   }
                                    });
                                   
                                    
                                  }, child: Padding(
                                    padding:  EdgeInsets.all(width*0.025),
                                    child: Text("Submit",style:TextStyle(fontSize:18)),
                                  )),
                              ),
                            ),
                          )
                     
              
              
                             ]
                ),
              ),
            ),
          )
      )
        ])
        
      )
      
     
    );
  }
}
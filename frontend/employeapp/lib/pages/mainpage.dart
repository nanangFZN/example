import 'package:employeapp/cons/cons.dart';
import 'package:employeapp/controllers/employe_controller.dart';
import 'package:employeapp/pages/detail.dart';
import 'package:employeapp/pages/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final EmployeController employeC = Get.put(EmployeController());
  @override
  void initState(){
    super.initState();
    employeC.getData();
  }

  @override
  Widget build(BuildContext context) {
    dynamic width = MediaQuery.of(context).size.width;
    dynamic height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Cons.col.fifth,
        backgroundColor: Cons.col.third,
        child:Icon(Icons.add),
        onPressed: (){
          Get.to(()=>FormPage());
        },
      ),
      body:Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.05,
                0.3,
                0.7,
              ],
              colors: [
                Cons.col.third,
                Cons.col.second,
                Cons.col.primary
              ]
            )
          ),
        child:Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.05,
                0.3,
                0.7,
              ],
              colors: [
                Cons.col.third,
                Cons.col.second,
                Cons.col.primary
              ]
            )
          ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Padding(
                padding:  EdgeInsets.only(top:height*0.015,left:width*0.025),
                child: Text("Employee List",
                style:TextStyle(
                  color:Colors.white,
                  fontSize:24,
                  fontWeight:FontWeight.bold
                )
                ),
              ),

              SizedBox(height:height*0.015),
              Expanded(
                child: Obx(()=>
                employeC.isLoading.value ? Center(child:CircularProgressIndicator())
                :
                employeC.dataEmploye.isEmpty ? Center(child:Text("There Is No Data ",style:TextStyle(color:Colors.white)))
                :
                ListView.builder(
                  itemCount: employeC.dataEmploye.length,
                  itemBuilder: (ctx,i){
                   
                    return Column(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              employeC.eidC.text = employeC.dataEmploye[i].id.toString();
                              employeC.enameC.text=employeC.dataEmploye[i].name.toString();
                              employeC.enipC.text=employeC.dataEmploye[i].nip.toString();
                              employeC.edivC.text=employeC.dataEmploye[i].division.toString();
                              employeC.elevC.text=employeC.dataEmploye[i].level.toString();
                              employeC.epobC.text=employeC.dataEmploye[i].pob.toString();
                              employeC.ebodC.text=employeC.dataEmploye[i].bod.toString();
                              employeC.ephoneC.text=employeC.dataEmploye[i].bod.toString();
                              employeC.eemailC.text=employeC.dataEmploye[i].bod.toString();
                              employeC.eaddressC.text=employeC.dataEmploye[i].bod.toString();
                              employeC.imageUrl=employeC.dataEmploye[i].photo.toString();
                             employeC.nip = employeC.dataEmploye[i].nip.toString();
                              Get.to(DetailsPage(),arguments: employeC.dataEmploye[i].nip);
                              
                            });
                            
                            
                            },
                          child: Container(
                            margin:EdgeInsets.all(width*0.025),
                            width:double.infinity,
                            height: height*0.2,
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:[
                                Padding(
                                  padding:  EdgeInsets.only(left:width*0.025),
                                  child: Container(
                              width:width*0.3,
                              height:height*0.3,
                              decoration:BoxDecoration(
                                shape:BoxShape.circle,
                                border: Border.all(color:Colors.white,width:4),
                                image: DecorationImage(image:NetworkImage("http://192.168.100.5/backend/action/photoDocs/"+employeC.dataEmploye[i].photo!),fit:BoxFit.fill)
                              )
                              )
                                ),
                               Expanded(
                                child: Padding(
                                  padding:  EdgeInsets.only(left:width*0.015),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(employeC.dataEmploye[i].name!,
                                          style:TextStyle(
                                            fontSize:16,
                                            fontWeight:FontWeight.bold,
                                            color:Colors.white
                                          )
                                          ),
                                          SizedBox(height:height*0.05),
                                           Text(employeC.dataEmploye[i].nip!,
                                    style:TextStyle(
                                      fontSize:16,
                                      fontWeight:FontWeight.w500,
                                      color:Colors.white.withOpacity(0.5)
                                    )
                                    ),
                                    ],
                                  ),
                        
                                ),
                                     )
                              ]
                            )
                          ),
                        ),
                        Divider(
                          height:height*0.015,
                          thickness: width*0.005,
                          color:Cons.col.second
                        )
                      ],
                    );
                  },
                )   
                ),
              )
            ]
          ),
        ),
        )
      )
    );
  }
}
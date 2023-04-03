import 'package:employeapp/controllers/employe_controller.dart';
import 'package:employeapp/pages/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}
final EmployeController employC = Get.put(EmployeController());

class _AuthPageState extends State<AuthPage> {
  TextEditingController nipC = TextEditingController();
  TextEditingController passC= TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              width:double.infinity,
              height:height,
              decoration:BoxDecoration(
                gradient: LinearGradient(
                  begin:Alignment.topRight,
                  end:Alignment.bottomLeft,
                  stops:[
                    0.3,
                    0.5,
                    0.8
                  ],
                  colors:[
                    Color(0xff33135C),
                    Color(0xff652EC7),
                    Color(0xffDE38C8),
                  ] )
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Container(
                    width:double.infinity,
                    height:height*0.45,
                    margin:EdgeInsets.all(15),
                   
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Center(
                          child: Text("Sign In",
                          style:TextStyle(
                            fontSize:28,
                            fontWeight:FontWeight.bold,
                            color:Colors.white
                          )
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left:width*0.05,top:height*0.025),
                          child: Text("Username",
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
                            controller: employC.uC,
                            keyboardType: TextInputType.streetAddress,
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
                          padding:  EdgeInsets.only(left:width*0.05,top:height*0.05),
                          child: Text("Password",
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
                            controller: employC.pC,
                            obscureText: true,
                            keyboardType: TextInputType.streetAddress,
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
                        Center(
                          child: Padding(
                            padding:  EdgeInsets.only(top:height*0.025),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color:Color(0xffFFFFFF).withOpacity(0.2),width: 2)
                              ),
                              child: ElevatedButton(
                                style:ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff652EC7).withOpacity(0.4)),
                                onPressed: ()async{
                                  employC.login();
                                  //Get.to(MainPage());
                                },
                                 child: Padding(
                                   padding:  EdgeInsets.all(width*0.025),
                                   child: Text("Sign In",style:TextStyle(fontSize:24)),
                                 )),
                            ),
                          ),
                        )
                      ]
                    )
                  )
                ]
              )
            )
          ]
        ),
      ),
    );
  }
}
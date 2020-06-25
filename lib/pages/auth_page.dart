import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:smartHome/pages/home_page.dart';
import 'package:smartHome/utility/constant.dart';
import 'package:smartHome/utility/get_screen_size.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool formVisible;
  int formsIndex;

  @override
  void initState() { 
    super.initState();
    formVisible = false;
    formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    getScreenSize(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageStore.introBackground),
            fit: BoxFit.cover,
          )
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                color: Colors.black54,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: screenHeight*0.15),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, bottom: 0.0,left: 10, right: 10),
                          child: Text('Welcome', style: TextStyle(color: Colors.white, fontSize: 30),)
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 0.0,left: 10, right: 10),
                          child: Text('Welcome to this awesome App.\n You are awesome.', style: TextStyle(color: Colors.grey, fontSize: 18), textAlign: TextAlign.center,)
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 40.0, bottom: 10.0,left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.home, color: ColorCode.PrimaryColor, size: 50,),
                              Text('smartHome', style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.w500 ),)
                            ],
                          )
                        ),

                        SizedBox(height: screenHeight*0.2,),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  color: ColorCode.PrimaryColor,
                                  textColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text('Login'),
                                  onPressed: (){
                                    setState(() {
                                      formVisible = true;
                                      formsIndex = 1;
                                    });
                                  }
                                ),
                              ),

                              const SizedBox(width: 10,),

                              Expanded(
                                child: RaisedButton(
                                  color: Colors.grey.shade700,
                                  textColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text('Signup'),
                                  onPressed: (){
                                    setState(() {
                                      formVisible = true;
                                      formsIndex = 2;
                                    });
                                  }
                                ),
                              ),
                          
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        SignInButton(
                          Buttons.Google,
                          onPressed: (){}
                        ),

                        SignInButton(
                          Buttons.Apple,
                          onPressed: (){}
                        ),

                        const SizedBox(height: 20,),
                      ],
                    ),
                  ],
                )

              ),
              
            ),

            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: (!formVisible)
                ? null
                : Container(
                  color: Colors.black54,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            textColor: formsIndex == 1? Colors.white : Colors.black,
                            color: formsIndex == 1? ColorCode.PrimaryColor : Colors.white,
                            child: Text('Login'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            onPressed: (){
                              setState(() {
                                formsIndex = 1;
                              });
                            }
                          ),

                          const SizedBox(width: 10,),

                          RaisedButton(
                            textColor: formsIndex == 2? Colors.white : Colors.black,
                            color: formsIndex == 2? ColorCode.PrimaryColor : Colors.white,
                            child: Text('Signup'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            onPressed: (){
                              setState(() {
                                formsIndex = 2;
                              });
                            }
                          ),

                          const SizedBox(width: 10,),

                          IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.clear,), 
                            onPressed: (){
                              setState(() {
                                formVisible = false;
                              });
                            }
                          )

                        ],
                      ),

                      Container(
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: formsIndex == 1? LoginForm() : SignupForm(),
                        ),
                      )

                    ],
                  ),
                ),
            )

          ],
        ),

      ),      
    );
  }
}



class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16)
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Email",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorCode.PrimaryColor,
                )
              ),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Password",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorCode.PrimaryColor,
                )
              ),
            ),
          ),

          const SizedBox(height: 10),

          InkWell(
            child: Text('Forgot Password?', style: TextStyle(color: ColorCode.PrimaryColor, fontSize: 18, ),),
            onTap: (){},
          ),

          const SizedBox(height: 10),

          RaisedButton(
            color: ColorCode.PrimaryColor,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('Login'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage() ));
            }
          ),

        ],
      ),
    );
  }
}


class SignupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16)
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Name",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorCode.PrimaryColor,
                )
              ),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            decoration: InputDecoration(
              hintText: "Enter Email",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorCode.PrimaryColor,
                )
              ),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Password",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorCode.PrimaryColor,
                )
              ),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Confirm Password",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorCode.PrimaryColor,
                )
              ),
            ),
          ),

          const SizedBox(height: 10),

          RaisedButton(
            color: ColorCode.PrimaryColor,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('Signup'),
            onPressed: (){}
          ),

        ],
      ),
    );
  }
}
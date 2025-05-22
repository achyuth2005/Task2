import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:task2/main.dart';
// import 'package:task2/password_generator.dart';
import 'dart:math';
import 'package:flutter/services.dart';
late Function() f_;
class HomePage extends StatefulWidget {
  final bool isDarkMode;
 final Function() onThemeToggle;
  const HomePage({super.key, required this.isDarkMode,required this.onThemeToggle});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int passwordsecurity=0;
  double _passwordsecurity=0.0;
  String password='';
  double sliderValue = 8;
  List<Map<String,dynamic>> hallList=[
    {
      'icon': Icons.text_fields,
      'text': "Include Upper case letters",
      'switch': false,
      'colors':Colors.lightGreen
    },
    {
      'icon': Icons.closed_caption_off,
      'text': "Include Lower Case letters",
      'switch': false,
      'colors':Colors.indigoAccent
    },
    {
      'icon': Icons.numbers_outlined,
      'text': "Include numbers",
      'switch': false,
      'colors':Colors.pinkAccent
    },
    {
      'icon': Icons.currency_rupee_outlined,
      'text': "Include special characters",
      'switch': false,
      'colors':Colors.orangeAccent
    }
  ];
  double onpasswordgeneration(int sliderValue){
    password='';
    passwordsecurity=sliderValue;
    const upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lower = 'abcdefghijklmnopqrstuvwxyz';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*()_+-=[]{}|;:,.<>?';
    if (hallList[0]['switch']) {password += upper; passwordsecurity++;}
    if (hallList[1]['switch']) {password += lower;passwordsecurity++;}
    if (hallList[2]['switch']) {password += numbers;passwordsecurity++;}
    if (hallList[3]['switch']) {password += symbols;passwordsecurity++;}
    final rand = Random.secure();
    if (password.isEmpty) password= 'Select at least one option';
    else password=List.generate(sliderValue, (_) => password[rand.nextInt(password.length)]).join();

    return passwordsecurity/36*10;
  }
  late TextEditingController passwordController;
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NeumorphicIcon(
                      Icons.key,
                    size: 50,
                    style: NeumorphicStyle(
                      color: Colors.grey[400],
                      depth: 10,
                      intensity: 0.6,
                      lightSource: LightSource.topLeft
                    ),),
                    NeumorphicText(
                      'Password Generator',
                      style: NeumorphicStyle(
                        color: Colors.grey[400],
                        depth: 2,
                        intensity: 0.6,
                        lightSource: LightSource.topLeft
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: 30
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 120,
                        width: double.infinity,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            depth: -10,
                            intensity: 0.6,
                            lightSource: LightSource.topLeft,
                            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30))
                          ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex:2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: NeumorphicText('  Choose the password length',
                                        style: NeumorphicStyle(
                                          color: Colors.grey[800],
                                          depth:2,
                                          intensity: 0.6,
                                          lightSource: LightSource.topLeft
                                        ),
                                        textStyle: NeumorphicTextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                ),
                                Expanded(
                                  flex:5,
                                    child:Container(
                                      width: double.infinity,
                                      child: Neumorphic(
                                        style: NeumorphicStyle(
                                            depth: -10,
                                            intensity: 0.8,
                                            lightSource: LightSource.topLeft,
                                            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30))
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: NeumorphicSlider(
                                                min:8,
                                                max:32,
                                                value: sliderValue,
                                                onChanged: (value){
                                                  setState(() {
                                                    sliderValue=value;
                                                  });
                                                },
                                              ),
                                            ),
                                            NeumorphicText(
                                              'Choosen password length : ${sliderValue.round()}',
                                              style: NeumorphicStyle(
                                                  color: Colors.grey[800],
                                                  depth:2,
                                                  intensity: 0.6,
                                                  lightSource: LightSource.topLeft
                                            ),
                                              textStyle: NeumorphicTextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                )
                              ],
                            )
                        )
                    ),

                    SizedBox(height: 20,),
                    Container(
                      height: 300,
                      child: ListView.builder(
                          itemCount: hallList.length,
                          itemBuilder: (context,index){
                            final hall=hallList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 55,
                                          width: 55,
                                          child: Neumorphic(
                                            style: NeumorphicStyle(
                                                depth: -5,
                                                boxShape: NeumorphicBoxShape.circle()
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: Neumorphic(
                                                  style: NeumorphicStyle(
                                                      shape: NeumorphicShape.flat,
                                                      depth: 5,
                                                      boxShape: NeumorphicBoxShape.circle()
                                                  ),
                                                  child: Center(
                                                    child: NeumorphicIcon(
                                                      hall['icon'],
                                                      size: 25,
                                                      style: NeumorphicStyle(
                                                          color: hall['switch']==true?hall['colors']: Colors.grey[400]
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                      SizedBox(width: 20,),
                                      NeumorphicText(
                                        hall['text'],
                                        style: NeumorphicStyle(
                                          depth: 2,
                                          lightSource: LightSource.topLeft,
                                          color: Colors.grey,
                                        ),
                                        textStyle: NeumorphicTextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600
                                        ),
                                      )
                                    ],
                                  ),
                                  NeumorphicSwitch(
                                    height: 30,
                                    value: hall['switch'],
                                    style: NeumorphicSwitchStyle(
                                        activeThumbColor: Colors.white,
                                        activeTrackColor: hall['colors']
                                    ),
                                    onChanged: (value){
                                      setState(() {
                                        hall['switch']=value;
                                      });
                                    },
                                  )
                                ],
                              ),
                            );
                          }
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: (){
                      _passwordsecurity=onpasswordgeneration(sliderValue.round());

                      setState(() {});
                    },
                    child: Neumorphic(
                      child: NeumorphicText('Generate Password',
                        style: NeumorphicStyle(
                          color: Colors.green
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 30
                        ),
                      ),
                    )
                ),
                TextField(
                  controller: TextEditingController(text: password),
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: "Generated Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  children: [
                    NeumorphicText('your password security is ${_passwordsecurity.round()} out of 10',
                    style: NeumorphicStyle(
                      color: Colors.black
                    ),
                      textStyle: NeumorphicTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    )
                  ],
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.copy),
                    onPressed: (password.isNotEmpty || (password!='Select at least one option'))?(){Clipboard.setData(ClipboardData(text: password));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Password copied to clipboard")),
                    );
                  }:null,
                    label: Text('Copy to clipboard')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NeumorphicText('Toggle to dark Mode(technically yellow)',
                    style: NeumorphicStyle(
                      color: Colors.grey
                    ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    NeumorphicSwitch(
                      style: NeumorphicSwitchStyle(
                        activeThumbColor: Colors.yellow,
                        activeTrackColor: Colors.yellow
                      ),
                      value: widget.isDarkMode,
                      onChanged: (value) {
                        widget.onThemeToggle();
                      },),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

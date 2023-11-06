import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';




class settings extends StatelessWidget {
    bool valNotify1 = true;
    bool valNotify2 = false;
    bool valNotify3 = true;

    onChangeFunction1(bool newValue1) {
    }
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(
  backgroundColor: Colors.grey,
  title: Text(
    'Settings',
     style: TextStyle(
      fontFamily: 'Readex Pro',
      color: Colors.black,
      fontWeight: FontWeight.w600,
      ),
    ),
),
body: Container(
  padding: const EdgeInsets.all(10),
  child: ListView(
    children: [
      SizedBox(height: 10),
      Row(
        children: [
          Icon(
            Icons.person,
            color: Colors.blue,
          ),
          SizedBox(width:10),
          Text("Account", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
      ],
      ),
      Divider(height: 20, thickness: 1),
      SizedBox(height: 10),
      buildAccountOption(context, "Location Services"),
      buildAccountOption(context, "Language"),
      buildAccountOption(context, "Tutorial"),


      Divider(height: 20, thickness: 1),
      SizedBox(height: 10),
      buildAccountOption(context, "Submit a Bug"),
      buildAccountOption(context, "Submit a Feature Request"),
      




    ],
    )
)

    );
  }
  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Option 1"),
                Text("Option 2")
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text("Close"))
            ],


          );

        });

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              )),
              Icon(Icons.arrow_forward_ios, color: Colors.grey),



          ],

        )
        ),
    );
  }

  Padding buildNotificationOption(String title, bool value, Function onChangedMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            )),
            Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: Colors.blue,
                trackColor: Colors.grey,
                value: value,
                onChanged: (bool newValue) {
                  onChangedMethod(newValue);
                },

              ),
              )

          ],
          ),
      );
  }


}


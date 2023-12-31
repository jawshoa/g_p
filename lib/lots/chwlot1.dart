import 'package:flutter/material.dart';
import 'package:characters/characters.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class piselot extends StatelessWidget {

final String apiURL = 'https://nam1.cloud.thethings.network/api/v3/as/applications/get-parked-lot-0/packages/storage/uplink_message';

  

 Future<Map<String, dynamic>?> fetchDataFromTTN() async {
  try {
    final response = await http.get(
      Uri.parse(apiURL),
      headers: {'Authorization': 'Bearer AYu6kZjmXre9C79EARwviw=='},
    );

  print('Response status code: ${response.statusCode}');
  print('Response body: ${response.body}');


    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to fetch uplink message. Status code: ${response.statusCode}');
    }
      
  } catch (error) {
    print('Error: $error');
  }
  return null;
 }


 

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('CHW lot1')
      ),
      
       body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [

                   Stack(
                    alignment: Alignment.bottomCenter,
                   children: [


                    Container(
                      child: FittedBox(
                        child: Image.network(
                          'https://storage.googleapis.com/getparked/CHW%20lot1.jpg',
                          fit: BoxFit.fitHeight,
                          height: 600,
                        ),
                      ),
                    ),







                    //for (int x = 0; x < binaryString.length; x++) 


                    for (int row = 0; row < 6; row++)

                    for (int i=0; i< 30; i++)


                    ElevatedButton(
                      onPressed: () async{
                         Map<String, dynamic>? ParkingData = await fetchDataFromTTN();
                      },
                      child: Text('Fetch Data from TTN'),
                    ), 
                    
             


                    Container(                // GREEN BOX  
                    child: Positioned(
                      top: 7,        // TOP ALIGNMENT
                      left: 138,    // HIGHER = RIGHT
                        child: Container(       // ACTUAL GREEN BOX
                          width: 6.4,
                          height: 15,
                          color: Colors.green,


                    ),
                    ),
                    ),


                   ],
                   ),


                    




 


















                      Padding(

                  padding: EdgeInsetsDirectional.fromSTEB(8, 50, 8, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.black,),),), ),



                      
                      const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Parking Lot Availability',
                            style:TextStyle(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 1,
                                 fontSize: 16,
                                ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 8),
                                  child: Text(
                                    'Available: ',
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Text(
                                    '354',
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF5AEF39),
                                                                                   fontSize: 16,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Text(
                                    'Occupied: ',
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFEF393C),
                                                                                   fontSize: 16,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Text(
                                    'Handicapped:',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Text(
                                    ' 0',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.normal,
                                         fontSize: 16,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  ),
                )
              
            );
  }
}
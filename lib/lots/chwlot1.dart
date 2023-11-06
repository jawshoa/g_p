import 'package:flutter/material.dart';
import 'package:characters/characters.dart';


class piselot extends StatelessWidget {
   piselot({super.key});
  

 @override
 Widget build(BuildContext context) {
    String binaryString = '110010101';
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

                    for (int x = 0; x < binaryString.length; x++) 

                    for (int row = 0; row < 6; row++)

                    for (int i=0; i< 30; i++)
             


                    Container(                // GREEN BOX  
                    child: Positioned(
                      top: 7 + row * 40,        // TOP ALIGNMENT
                      left: 138 + i * 8.445,    // HIGHER = RIGHT
                        child: Container(       // ACTUAL GREEN BOX
                          width: 6.4,
                          height: 15,
                          color: binaryString[x] == 1? Colors.green : Colors.green,


                    ),
                    ),
                    ),

                    for (int x = 0; x < binaryString.length; x++) 

                    for (int row = 0; row < 6; row++)

                    for (int i = 0; i < 15; i++)
             
                  
                    Container(  
                    child: Positioned(
                      top: 7,
                      left: 138,
                        child: Container(
                          width: 6.4,
                          height: 15,
                          color: binaryString[x] == 1? Colors.red : Colors.red,

                          
                    ),
                    ),
                    ),

                    Container(
                    child: Positioned(
                      top: 47,
                      left: 146,
                        child: Container(
                          width: 6.4,
                          height: 15,
                          color:  Colors.red,

                          
                    ),
                    ),
                    ),

                    Container(
                    child: Positioned(
                      top: 7,
                      left: 181,
                        child: Container(
                          width: 6.4,
                          height: 15,
                          color:  Colors.red,

                          
                    ),
                    ),
                    ),

                    Container(
                    child: Positioned(
                      top: 47,
                      left: 188.5,
                        child: Container(
                          width: 6.4,
                          height: 15,
                          color:  Colors.red,

                          
                    ),
                    ),
                    ),

                    Container(
                    child: Positioned(
                      top: 47,
                      left: 205.5,
                        child: Container(
                          width: 6.4,
                          height: 15,
                          color:  Colors.red,

                          
                    ),
                    ),
                    ),

                    Container(
                    child: Positioned(
                      top: 87,
                      left: 222.5,
                        child: Container(
                          width: 6.4,
                          height: 15,
                          color:  Colors.red,

                          
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
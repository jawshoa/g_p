/*
* Copyright 2021 HiveMQ GmbH
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*       http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class TTNDataPage extends StatefulWidget {
  @override
  _TTNDataPageState createState() => _TTNDataPageState();
}

class _TTNDataPageState extends State<TTNDataPage> {
  List<int> binaryList = [];
  late MqttServerClient client;
  String frmPayload = '';
  
  @override
  void initState() {
    super.initState();
    connectToTTN();
  }

  Future<int> connectToTTN() async {
    client = MqttServerClient('nam1.cloud.thethings.network', '');
    client.port = 1883;
    client.logging(on: true);
    client.setProtocolV311();
    client.keepAlivePeriod = 20;
    client.connectTimeoutPeriod = 2000;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.onDisconnected = onDisconnected;


    final connMessage = MqttConnectMessage()
        .withClientIdentifier('1234')
        .withWillTopic('willtopic')
        .withWillMessage('My Will message')
        .startClean()
        .authenticateAs("get-parked-lot-0@ttn", "NNSXS.WJB3FZAYQWOSTY5DU6OVQOD5HWX64XDBJ4ESFVY.BX2ESTTMC3MXQ2NGBL332Q6V4JX4YGGTDGE5TKX4KKU4ZEIEZ3WQ")
        .withWillQos(MqttQos.atLeastOnce);
        print("Connecting bruh");

    client.connectionMessage = connMessage;
    
    try {
      await client.connect("get-parked-lot-0@ttn", "NNSXS.WJB3FZAYQWOSTY5DU6OVQOD5HWX64XDBJ4ESFVY.BX2ESTTMC3MXQ2NGBL332Q6V4JX4YGGTDGE5TKX4KKU4ZEIEZ3WQ");

    } on NoConnectionException catch (e) {

      print('Exception: $e');
      client.disconnect();
    } on SocketException catch (e) {
      print('Socket exception - $e');
      client.disconnect();
    }

  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print('EXAMPLE::Mosquitto client connected');
  } else {
    /// Use status here rather than state if you also want the broker return code.
    print(
        'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect();
    exit(-1);
  }
  print('EXAMPLE::Subscribing to parking data topic');
  const topic = 'v3/get-parked-lot-0@ttn/devices/eui-70b3d57ed0061863/up'; // Not a wildcard topic
  client.subscribe(topic, MqttQos.atMostOnce);









  client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    final recMess = c![0].payload as MqttPublishMessage;
    final pt =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

    /// The above may seem a little convoluted for users only interested in the
    /// payload, some users however may be interested in the received publish message,
    /// lets not constrain ourselves yet until the package has been in the wild
    /// for a while.
    /// The payload is a byte buffer, this will be specific to the topic
    print(
        'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
        print("");
            // parse frm_payload from $pt


    print('');
  });




   /// If needed you can listen for published messages that have completed the publishing
  /// handshake which is Qos dependant. Any message received on this stream has completed its
  /// publishing handshake with the broker.
  client.published!.listen((MqttPublishMessage message) {
    print(
        'EXAMPLE::Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
  });


  /// Ok, we will now sleep a while, in this gap you will see ping request/response
  /// messages being exchanged by the keep alive mechanism.
  print('EXAMPLE::Sleeping....');
  await MqttUtilities.asyncSleep(600);

  /// Finally, unsubscribe and exit gracefully
  print('EXAMPLE::Unsubscribing');
  client.unsubscribe(topic);

  /// Wait for the unsubscribe message from the broker if you wish.
  await MqttUtilities.asyncSleep(2);
  print('EXAMPLE::Disconnecting');
  client.disconnect();
  print('EXAMPLE::Exiting normally');
  return 0;
  }

  void onConnected() {
    print('Connected to TTN');
    client.subscribe('v3/get-parked-lot-0@ttn/devices/eui-70b3d57ed0061863/up', MqttQos.atLeastOnce);
  }

  void onSubscribed(String topic) {
    print('Subscribed to $topic');
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);
      final data = jsonDecode(pt);

      final frmPayload = data['uplink_message']['frm_payload'];

      List<int> frmPayloadBinary = base64Decode(frmPayload);
      

      String fourBitBinary = '';

      frmPayloadBinary.forEach((byte) {
        String binaryString = byte.toRadixString(2).padLeft(8, '0');
        fourBitBinary += '${binaryString.substring(0, 4)}${binaryString.substring(4)}';
      });

     //List<int> 

      binaryList = fourBitBinary.split('').map((char) => int.parse(char)).toList();


      List<bool> booleanParkingDataList = binaryList.map((int value) => value == 1).toList();



      setState(() {
        this.frmPayload = frmPayload;
      });





            
      print(''); 
      print('frm_payload is $frmPayload'); 
      print('Binary Data is $frmPayloadBinary'); 
      print('4-bit Binary Data: $fourBitBinary');


      print('Parking Data Binary List: $binaryList');
      print('Boolean Data Binary List: $booleanParkingDataList');



      print(''); 


      });
  }


  void onDisconnected() {
    print('Disconnected from TTN');
  }





//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//     appBar: AppBar(
//        title: Text('TTN Data'),
//      ),
//      body: Center(
//        child: Column( mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Text(frmPayload),
//            SizedBox(height: 20),
//            ElevatedButton(
//             onPressed: (){
//                print('Binary List Values for Parking Availability: $binaryList');
//
//
//              },
//              child: Text('Show 4-bit Binary Data'),
//            ),
//          ],
//        ),
//      ),
//   );
//  }
//}

@override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('PARKING LOT TEST DATA')
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
                    Text(frmPayload),
                    SizedBox(height: 20),
                    ElevatedButton(
                    onPressed: (){
                print('Binary List Values for Parking Availability: $binaryList');
              },
              child: Text('Show 4-bit Binary Data'),
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




import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:g_p/lots/cbalot1.dart';
import 'package:g_p/lots/chwlot2.dart';
import 'package:g_p/lots/chwlot1.dart';
import 'package:g_p/lots/porta.dart';




class Map extends StatefulWidget {
  const Map({super.key});
  @override

  State<Map> createState() => _MapState();
}


class _MapState extends State<Map> {
  late GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();

  static const LatLng PISElot = LatLng(48.488845, -123.416393);
  static const LatLng PISElot2 = LatLng(48.488359, -123.415606);
  static const LatLng Teclot = LatLng(48.49100021607449, -123.41433389677556);
  static const LatLng Frontlot = LatLng(48.489749134000775, -123.41793289900832);

  



  
  final LatLng _center = const LatLng(48.488739628184426, -123.41614664338401);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  


  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                Text('Map',
                 style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              ),
              SizedBox(width: 8),
               Image.network(
                  'https://storage.googleapis.com/getparked/logo2.png',
                  width: 125,
                  height: 1000,
                  fit: BoxFit.contain,
                ),
          ],
        ),        
      ),

      body: Column(
        children: [
          Expanded(

          
        child: GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition: CameraPosition(target: _center,
        zoom: 15.5,
        ),

markers: {
  Marker(
    markerId: MarkerId("CHW lot1"),
    
    infoWindow: InfoWindow(
    title: 'CHW lot1',
    snippet: '567 Available' ),

    icon: BitmapDescriptor.defaultMarker,

    onTap: () {
      _showPISE(context, 'CHW lot1');
    },
    position: PISElot),



    Marker(
    markerId: MarkerId("CHW lot2"),
    infoWindow: InfoWindow(
      title: 'CHW lot2',
      snippet: '567 Available'
      ),

    icon: BitmapDescriptor.defaultMarker,
    onTap: () {
      _showPISE2(context, "CHW lot2");
    },
    position: PISElot2),




    Marker(
    markerId: MarkerId("CBA lot1"),
    infoWindow: InfoWindow(
      title: 'CBA lot1',
     snippet: '12 Available' ),   // number of parking stalls
    icon: BitmapDescriptor.defaultMarker,
    onTap: () {
      _showTech(context, "CBA lot1");
    },
    position: Teclot),





    Marker(
    markerId: MarkerId("Portable A Lot"),
    infoWindow: InfoWindow(
      title: 'Portable A lot',
      snippet: '78 Available'
      ),

    icon: BitmapDescriptor.defaultMarker,
    onTap: () {
      _showFront(context, "Portable A Lot");
    },
    position: Frontlot),
},

      ),
        )
        ]
      )


    );
  }
}








  void _navigateToPISE(BuildContext context, String lotName) {
    // Implement logic to navigate to another page here
    // For example:
     Navigator.push(context, MaterialPageRoute(builder: (context) => piselot()));

  }

    void _navigateToFront(BuildContext context, String lotName) {
    // Implement logic to navigate to another page here
    // For example:
     Navigator.push(context, MaterialPageRoute(builder: (context) => frontlot()));

  }

  void _navigateToTech(BuildContext context, String lotName) {
    // Implement logic to navigate to another page here
    // For example:
     Navigator.push(context, MaterialPageRoute(builder: (context) => techlot()));
  }

    void _navigateToPISE2(BuildContext context, String lotName) {
    // Implement logic to navigate to another page here
    // For example:
     Navigator.push(context, MaterialPageRoute(builder: (context) => PISElot2()));
  }











void _showFront (BuildContext context, String lotName) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text(lotName),
                subtitle: Text("Number of parking stalls and other information"),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                child: Text('Go to Lot'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,

                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12, 
                    fontStyle: FontStyle.italic),

                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(600))),
                      shadowColor: Colors.lightBlue,
          ),    

                
                onPressed: () {
                  _navigateToFront(context, lotName);
                }
                
              ),
            ],
          ),
        );
      },
    );
  }

  void _showTech (BuildContext context, String lotName) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text(lotName),
                subtitle: Text("Number of parking stalls and other information"),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  _navigateToTech(context, lotName);
                },
                child: Text('Go to Tech Lot'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPISE(BuildContext context, String lotName) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text(lotName),
                subtitle: Text("Number of parking stalls and other information"),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  _navigateToPISE(context, lotName);
                },
                child: Text('Go to PISE Lot'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPISE2(BuildContext context, String lotName) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text(lotName),
                subtitle: Text("Number of parking stalls and other information"),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  _navigateToPISE2(context, lotName);
                },
                child: Text('Go to PISE Lot'),
              ),
            ],
          ),
        );
      },
    );
  }



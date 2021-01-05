import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mgosme/models/address.dart';
import 'package:mgosme/utilities/styles.dart';

// ignore: must_be_immutable
class MapsAddress extends StatefulWidget {
  String uid;

  MapsAddress({this.uid});

  @override
  _MapsAddressState createState() => _MapsAddressState(uid: uid);
}

class _MapsAddressState extends State<MapsAddress> {
  final uid;

  _MapsAddressState({this.uid});

  double lat, lng;
  GoogleMapController mapController;

  TextEditingController streetController = TextEditingController();
  TextEditingController villageController = TextEditingController();

  MyAddress address=MyAddress();

  @override
  void initState() {
    getLatLng();
    //showMap();
    super.initState();
  }

  ///Get Lat and lng
  Future<void> getLatLng() async {
    LocationData locationData = await getLocationData();
    setState(() {
      lat = locationData.latitude;
      lng = locationData.longitude;
    });

    print('Lat: $lat Lng: $lng');
  }

  ///Get Location
  Future<LocationData> getLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('address')
              .doc(uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            Map<String, dynamic> data = snapshot.data.data();


            return Container(
              child: Stack(
                children: [
                  lat == null ? Styles().showProgress() : showMap(),
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(16)
                  //   ),
                  //   child: Container(
                  //     height: 40,
                  //     width: 40,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Icon(Icons.arrow_back,size: 15,),
                  //     // //height: 35,
                  //     // margin: EdgeInsets.only(left: 10),
                  //     // child: Row(
                  //     //   children: [
                  //     //     InkWell(
                  //     //       child: Icon(
                  //     //         Icons.arrow_back,
                  //     //         size: 20,
                  //     //       ),
                  //     //       onTap: () {
                  //     //         Navigator.of(context).pop();
                  //     //       },
                  //     //     ),
                  //     //     Expanded(
                  //     //       child: SearchMapPlaceWidget(
                  //     //         hasClearButton: true,
                  //     //         placeType: PlaceType.address,
                  //     //         placeholder: 'ຄົນຫາສະຖານທີ່',
                  //     //         apiKey: 'AIzaSyBl1HFOYU6jZ2VJcCRATO9J4evsp8XGgqo',
                  //     //         onSelected: (Place place)async{
                  //     //           Geolocation geolocation=await place.geolocation;
                  //     //           mapController.animateCamera(CameraUpdate.newLatLng(geolocation.coordinates),);
                  //     //           mapController.animateCamera(CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
                  //     //         },
                  //     //
                  //     //       ),
                  //     //     ),
                  //     //   ],
                  //     //),
                  //   ),
                  // ),
                  buildAddressDetail(context),
                ],
              ),
            );
          }),
    );
  }

  Container buildAddressDetail(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          child: Card(
            color: Colors.blue,
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 1.05,
              child: Center(
                child: Text(
                  'ເພີ່ມລາຍລະອຽດ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          onTap: () {

            buildShowDetailBottomSheet();
          },
        ),
      ),
    );
  }

  buildShowDetailBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ເພີ່ມລາຍລະອຽດທີ່ຢູ່'),
            Card(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 40,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text('Laos, Vientiane, Xaythany'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller:villageController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                  isDense: true,
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 0.25)),
                  hintText: 'ບ້ານ',
                  helperStyle: TextStyle(fontSize: 14)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: streetController ,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                  isDense: true,
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 0.25)),
                  hintText: 'ຖະໜົນ, ຮ່ອມ',
                  helperStyle: TextStyle(fontSize: 14)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ຍົກເລີກ'),
                ),
                MaterialButton(
                  onPressed: () {
                    _updateAddressToFireStore();
                  },
                  child: Text('ຕົກລົງ'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget searchTextBox() {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(8),
      ),
    );
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          hintText: 'ຄົ້ນຫາສະຖານທີ່',
          contentPadding: EdgeInsets.only(
            left: 10,
            top: 4,
            right: 4,
            bottom: 4,
          ),
          isDense: true,
          enabledBorder: border,
          focusedBorder: border,
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }

  Set<Marker> myMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId('myLocal'),
        position: LatLng(lat, lng),
        draggable: true,
        infoWindow: InfoWindow(
            title: 'ຕຳແໜ່ງທີ່ຢູ່',
            snippet: 'Lat = $lat, Lng = $lng',
            onTap: () {}),
      ),
    ].toSet();
  }

  Map<MarkerId, Marker> _marker = <MarkerId, Marker>{};
  int _markerIdCounter = 0;
  Completer<GoogleMapController> _mapController = Completer();

  showMap() {
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 16,
    );
    return Container(
      //height: MediaQuery.of(context).size.height / 1.5,
      child: GoogleMap(
        zoomControlsEnabled: false,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        markers: myMarker(),
        initialCameraPosition: cameraPosition,
        mapType: MapType.hybrid,
        onMapCreated: onMapCreated,
      ),
    );
  }

  ///Update Address To CloudFireStore
  Future _updateAddressToFireStore() async {
    Map<String,dynamic>map=Map();
    map['lat']=lat;
    map['lng']=lng;
    map['country']='Laos';
    map['province']='Vientiane';
    map['district']='Vientiane';
    map['village']=villageController.text;
    map['street']=streetController.text;
    address.addAdr(uid, map).then((value) {
        Navigator.of(context)
            .maybePop()
            .then((value) => Navigator.of(context).pop());
      }).catchError((error) => print('Failed to update Address: $error'));

  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}

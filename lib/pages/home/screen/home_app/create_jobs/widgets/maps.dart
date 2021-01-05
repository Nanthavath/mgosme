import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mgosme/utilities/styles.dart';

class Maps extends StatefulWidget {
  double lat, lng;

  Maps(this.lat, this.lng);

  @override
  _MapsState createState() => _MapsState(lat, lng);
}

class _MapsState extends State<Maps> {
  double lat, lng;

  _MapsState(this.lat, this.lng);

  @override
  void initState() {
    getLatLng();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              lat == null ? Styles().showProgress() : showMap(),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black38,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: buildButtonDetail(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showMap() {
    return Container(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: 15,
        ),
        mapType: MapType.hybrid,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
      ),
    );
  }

  Future<void> getLatLng() async {
    LocationData locationData = await getLocationData();
    setState(() {
      lat = locationData.latitude;
      lng = locationData.longitude;
    });
  }

  Future<LocationData> getLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  buildButtonDetail() {
    return Container(
      margin: EdgeInsets.all(20),
      child: InkWell(
        child: Card(
          child: Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width / 1.5,
            height: 40,
            child: Center(
                child: Text(
              'ເພີ່ມລາຍລະອຽດ',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
        onTap: () {
          _showModalBottomSheet();
        },
      ),
    );
  }

  void _showModalBottomSheet() {}
}

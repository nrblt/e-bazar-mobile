import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'drawer.dart';

class MapPage extends StatefulWidget {
  // const MapPage({Key? key}) : super(key: key);
  var name;
  var id;
  var _username;
  var _password;

  MapPage(this.name, this.id, this._username, this._password);
  @override
  _MapPageState createState() => _MapPageState(name, id,_username,_password);
}

class _MapPageState extends State<MapPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(49.500, 67),
    zoom: 4,
  );
  var name;
  var id;
  var _username;
  var _password;

  _MapPageState(this.name, this.id,this._username, this._password);

  late GoogleMapController _googleMapController;
  List<Marker> _markers = [];
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _addMarker(double lt, double ln, name, id) {
    _markers.add(Marker(
      markerId: MarkerId(id),
      position: LatLng(lt, ln),
      infoWindow: InfoWindow(title: name),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueGreen,
      ),
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _addMarker(49.500, 67, name, id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(_username,_password),
        key: _scaffoldKey,
        body: Stack(children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.hybrid,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(_markers),
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(5, 30, 0, 0),
            child:ClipRRect(
              borderRadius: BorderRadius.circular(50),

              child: Container(
                // ColoredBox(
                  height:40,
                  width:40,
                  color: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.menu,color: Colors.black),
                    onPressed: ()=>_scaffoldKey.currentState!.openDrawer(),
                  )
              ),
            ),



          )
        ]));
  }
}

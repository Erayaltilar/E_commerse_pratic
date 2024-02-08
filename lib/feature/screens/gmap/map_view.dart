// import 'package:e_commerse_pratik/core/consts/size/size.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapView extends StatefulWidget {
//   static const String routeName = "/map";
//   const MapView({super.key});

//   @override
//   State<MapView> createState() => MapViewState();
// }

// class MapViewState extends State<MapView> {
//   GoogleMapController? mapController;
//   late Marker selectedMarker;
//   late Set<Marker> _markers;

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   Marker _createMarker(
//       String markerId, double lat, double lng, Function() onTap) {
//     return Marker(
//       markerId: MarkerId(markerId),
//       position: LatLng(lat, lng),
//       onTap: onTap,
//     );
//   }

//   @override
//   void initState() {
//     super.initState();

//     _markers = {
//       _createMarker(
//         "Montania",
//         40.372865801940975,
//         28.891388586026615,
//         () => _onMarkerTapped("Montania"),
//       ),
//       _createMarker(
//         "ido",
//         40.3560766789832,
//         28.927391595701238,
//         () => _onMarkerTapped("ido"),
//       ),
//       _createMarker(
//         "mütareke",
//         40.379942157726155,
//         28.88179428776591,
//         () => _onMarkerTapped("mütareke"),
//       ),
//       // Diğer marker'ları da buraya ekleyin
//     };
//   }

//   Future<BitmapDescriptor> _createCustomMarkerBitmap() async {
//     final icon = await BitmapDescriptor.defaultMarkerWithHue(120);
//     return icon;
//   }

//   void _onMarkerTapped(String markerId) async {
//     final customMarkerBitmap = await _createCustomMarkerBitmap();
//     setState(() {
//       selectedMarker =
//           _markers.firstWhere((marker) => marker.markerId.value == markerId);

//       // Diğer marker'ları küçültme
//       _markers = _markers.map((marker) {
//         return marker.copyWith(iconParam: BitmapDescriptor.defaultMarker);
//       }).toSet();

//       // Tıklanan marker'ı büyütme
//       _markers = _markers.map((marker) {
//         if (marker.markerId.value == markerId) {
//           return marker.copyWith(
//             iconParam: customMarkerBitmap,
//           );
//         } else {
//           return marker;
//         }
//       }).toSet();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: ProjectSizes.xxxsmall),
//       child: GoogleMap(
//           initialCameraPosition: const CameraPosition(
//             target: LatLng(40.372865801940975, 28.891388586026615),
//             zoom: 12.0,
//           ),
//           markers: _markers,
//           onMapCreated: _onMapCreated),
//     );
//   }
// }

// //40.3560766789832, 28.927391595701238 ido kordinatları
// //40.372865801940975, 28.891388586026615 montainia kordinatları
// //40.379942157726155, 28.88179428776591 mütareke kordinatları

import 'package:e_commerse_pratik/feature/screens/gmap/controller/interactive_map_controller.dart';
import 'package:e_commerse_pratik/feature/screens/gmap/controller/interactive_map_marker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  List<MarkerItem> markers = [];
  InteractiveMapsController controller = InteractiveMapsController();

  @override
  void initState() {
    super.initState();
//    Fake delay for simulating a network request
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        markers.add(MarkerItem(
            id: 1, latitude: 40.3560766789832, longitude: 28.927391595701238));
        markers.add(MarkerItem(
            id: 2,
            latitude: 40.372865801940975,
            longitude: 28.891388586026615));
        controller.reset(index: 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                markers.add(MarkerItem(
                  id: 3,
                  latitude: 40.379942157726155,
                  longitude: 28.88179428776591,
                ));
                controller.reset(index: 2);
              });
            },
          )
        ],
      ),
      body: InteractiveMapsMarker(
        items: markers,
        controller: controller,
        center: const LatLng(40.3560766789832, 28.927391595701238),
        itemContent: (context, index) {
          MarkerItem item = markers[index];
          return BottomTile(item: item);
        },
        onLastItem: () {
          print('Last Item');
        },
      ),
    );
  }
}

class BottomTile extends StatelessWidget {
  const BottomTile({super.key, required this.item});

  final MarkerItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(width: 120.0, color: Colors.red),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Store Name ${item.id}",
                    style: Theme.of(context).textTheme.labelLarge),
                Text("${item.latitude} , ${item.longitude}",
                    style: Theme.of(context).textTheme.labelSmall),
                stars(),
                const Expanded(
                  child: Text('Mudi'),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row stars() {
    return const Row(
      children: <Widget>[
        Icon(Icons.star, color: Colors.orangeAccent, size: 16.0),
        Icon(Icons.star, color: Colors.orangeAccent, size: 16.0),
        Icon(Icons.star, color: Colors.orangeAccent, size: 16.0),
        Icon(Icons.star_half, color: Colors.orangeAccent, size: 16.0),
        Icon(Icons.star_border, color: Colors.orangeAccent, size: 16.0),
        SizedBox(width: 5),
        Text('3.5',
            style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 16.0,
                fontWeight: FontWeight.w600))
      ],
    );
  }
}

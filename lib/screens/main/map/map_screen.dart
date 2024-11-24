import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            // Map content
            const Positioned.fill(
              child: SmartBinsMap(),
            ),

            // Header content
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70.0),
                    bottomRight: Radius.circular(70.0),
                  ),
                ),
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Hi, Habib",
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const SizedBox(height: 20.0),
                        const Text("Available Balance",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white)),
                        Row(
                          children: [
                            const Text("0.00",
                                style: TextStyle(
                                    fontSize: 36.0, color: Colors.white)),
                            const SizedBox(width: 5.0),
                            Image.asset("assets/icons/gold.png", height: 24.0),
                          ],
                        )
                      ],
                    ),
                    const Icon(Icons.notifications_none_outlined,
                        color: Colors.white, size: 30.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmartBinsMap extends StatefulWidget {
  const SmartBinsMap({super.key});

  @override
  _SmartBinsMapState createState() => _SmartBinsMapState();
}

class _SmartBinsMapState extends State<SmartBinsMap> {
  LatLng userLocation = const LatLng(36.7783, -119.4179);

  final int numBins = 10;
  final double radiusInKm = 2.0;
  List<Marker> binMarkers = [];

  LocationData? _currentLocation;
  final Location _locationService = Location();
  late MapController _mapController;
  bool isMapInitialized = false;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _getLocation().then((locationData) {
      if (locationData != null) {
        setState(() {
          userLocation =
              LatLng(locationData.latitude!, locationData.longitude!);
          binMarkers =
              generateRandomBinMarkers(userLocation, numBins, radiusInKm);
        });
        if (isMapInitialized) {
          _mapController.move(userLocation, 13.0);
        }
      }
    });
  }

  Future<LocationData?> _getLocation() async {
    try {
      bool serviceEnabled;
      PermissionStatus permissionGranted;

      serviceEnabled = await _locationService.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _locationService.requestService();
        if (!serviceEnabled) throw Exception("Location services are disabled.");
      }

      permissionGranted = await _locationService.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _locationService.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          throw Exception("Location permissions are denied.");
        }
      }

      _currentLocation = await _locationService.getLocation();
      return _currentLocation;
    } catch (e) {
      return null;
    }
  }

  List<Marker> generateRandomBinMarkers(
      LatLng center, int count, double radiusKm) {
    final random = Random();
    final markers = <Marker>[];

    for (int i = 0; i < count; i++) {
      final angle = random.nextDouble() * 2 * pi;
      final distance = random.nextDouble() * radiusKm;

      final latOffset = distance / 110.574;
      final lonOffset = distance / (111.32 * cos(center.latitude * pi / 180));

      final randomLat = center.latitude + latOffset * cos(angle);
      final randomLon = center.longitude + lonOffset * sin(angle);

      markers.add(
        Marker(
          width: 50.0,
          height: 50.0,
          point: LatLng(randomLat, randomLon),
          child: const Icon(Icons.delete, color: Colors.red, size: 30),
        ),
      );
    }

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        onMapReady: () {
          isMapInitialized = true;
          _mapController.move(userLocation, 13.0);
        },
        initialCenter: userLocation,
        initialZoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: binMarkers,
        ),
      ],
    );
  }
}

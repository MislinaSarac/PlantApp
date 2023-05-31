import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlantMap {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  PlantMap(
      {required this.shopName,
      required this.address,
      required this.description,
      required this.thumbNail,
      required this.locationCoords});
}

final List<PlantMap> coffeeShops = [
  PlantMap(
      shopName: 'Star Plant',
      address: '18 W 29th St',
      description:
          'Coffee bar chain offering house-roasted direct-trade coffee, along with brewing gear & whole beans',
      locationCoords: LatLng(38.9573415, 35.240741),
      thumbNail:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.goodhousekeeping.com%2Fhome%2Fgardening%2Fg40742429%2Fbest-indoor-plants-for-health%2F&psig=AOvVaw0ujR0MzN0FWI56sIpNPFxd&ust=1685338328343000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCJjxydSkl_8CFQAAAAAdAAAAABAE'),
  PlantMap(
      shopName: 'Moon Flowers',
      address: '463 7th Ave',
      description:
          'All-day American comfort eats in a basic diner-style setting',
      locationCoords: LatLng(38.9573415, 37.240741),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
  PlantMap(
      shopName: 'Flowers',
      address: '240 Sullivan St',
      description:
          'Small spot draws serious caffeine lovers with wide selection of brews & baked goods.',
      locationCoords: LatLng(42.9573415, 33.240741),
      thumbNail:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.thespruce.com%2Fplants-with-big-flowers-4138211&psig=AOvVaw0ujR0MzN0FWI56sIpNPFxd&ust=1685338328343000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCJjxydSkl_8CFQAAAAAdAAAAABAJ'),
];

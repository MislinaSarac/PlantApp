import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

import '../../models/plants.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsFavotited(bool isFavotited) {
    return isFavotited;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 65,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint("favorite");
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          bool isFavotited = toggleIsFavotited(
                              _plantList[widget.plantId].isFavorated);
                          _plantList[widget.plantId].isFavorated = isFavotited;
                        });
                      },
                      icon: Icon(
                        _plantList[widget.plantId].isFavorated == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(_plantList[widget.plantId].imageURL),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _plantFeature(
                          title: 'Size',
                          plantFeature: _plantList[widget.plantId].size,
                        ),
                        _plantFeature(
                          title: 'Humidty',
                          plantFeature:
                              _plantList[widget.plantId].humidity.toString(),
                        ),
                        _plantFeature(
                          title: 'Temperature',
                          plantFeature: _plantList[widget.plantId].temperature,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(.4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _plantList[widget.plantId].plantName,
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            r'$' + _plantList[widget.plantId].price.toString(),
                            style: TextStyle(
                              color: Constants.blackColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _plantList[widget.plantId].rating.toString(),
                            style: TextStyle(
                              fontSize: 28,
                              color: Constants.primaryColor,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: 28,
                            color: Constants.primaryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        _plantList[widget.plantId].decription,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18,
                          color: Constants.blackColor.withOpacity(.4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Icon(Icons.shopping_cart, color: Colors.white),
              decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(.3),
                    ),
                  ]),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(.3),
                      ),
                    ]),
                child: Center(
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _plantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;

  const _plantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Constants.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

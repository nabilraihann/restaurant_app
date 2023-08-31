import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(restaurant.pictureId),
              Text(restaurant.name)
            ],
          ),
        ),
      ),
    );
  }
}

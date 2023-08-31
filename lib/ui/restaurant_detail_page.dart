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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(restaurant.pictureId),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_pin, size: 18),
                              const SizedBox(width: 5),
                              Text(restaurant.city),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.amberAccent,
                              ),
                              const SizedBox(width: 5),
                              Text(restaurant.rating.toString())
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        restaurant.description,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.justify,
                      ),
                      Divider(
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Menus:'),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Foods:'),
                                Text(
                                  restaurant.menus.foods
                                      .map((foods) => foods.name)
                                      .toString(),
                                ),
                                Text('Drinks:'),
                                Text(
                                  restaurant.menus.drinks
                                      .map((drink) => drink.name)
                                      .toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

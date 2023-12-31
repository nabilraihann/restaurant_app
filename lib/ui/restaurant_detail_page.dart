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
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                  padding: const EdgeInsets.all(15),
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
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.location_pin, size: 18),
                                  const SizedBox(width: 5),
                                  Text(restaurant.city,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amberAccent,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(restaurant.rating.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white))
                                ],
                              ),
                            ),
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
                      const Divider(
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Menus:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Drinks:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                              _buildDrinks(context),
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Foods',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              _buildFoods(context),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoods(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: restaurant.menus.foods
              .map(
                (food) => Container(
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Text(
                        food.name.toString(),
                        textAlign: TextAlign.start,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildDrinks(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: restaurant.menus.drinks
              .map(
                (food) => Container(
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Text(
                        food.name.toString(),
                        textAlign: TextAlign.start,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

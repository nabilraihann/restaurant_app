import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';

import '../data/model/restaurant.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Restaurant App",
          style: TextStyle(fontSize: 25),
        ),
        toolbarHeight: 170,
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/local_restaurant.json"),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(context, restaurants[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: restaurant);
      },
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        restaurant.pictureId,
        width: 100,
        errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
      ),
      title: Text(restaurant.name),
    );
  }
}

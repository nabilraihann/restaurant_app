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
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 12, left: 12),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        shadowColor: Colors.grey,
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, RestaurantDetailPage.routeName,
                arguments: restaurant);
          },
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image.network(
              restaurant.pictureId,
              width: 80,
              errorBuilder: (ctx, error, _) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
          title: Text(
            restaurant.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  restaurant.city,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(restaurant.rating.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

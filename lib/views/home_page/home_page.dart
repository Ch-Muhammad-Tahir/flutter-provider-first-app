import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/home_provider.dart';
import 'package:provider_example/views/favorite_view_Items_screen/favorite_screen_widget.dart';

import '../../utils/common_list.dart';

class MyHomePageScreenWidget extends StatelessWidget {
  const MyHomePageScreenWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add To cart")),
      body: Column(children: [
        ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoriteScreenWidget()));
            },
            icon: const Icon(Icons.favorite),
            label: Text(
              "Go To My List (${Provider.of<HomeProvider>(context, listen: true).favoriteList.length})",
              style: const TextStyle(fontSize: 25),
            )),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              // physics: ,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.green[100],
                  elevation: 5,
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    title: Text(
                      AppCommonList.products[index].productTitle,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                      child: Text(AppCommonList.products[index].prodcutPrice),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Provider.of<HomeProvider>(context, listen: false)
                              .addToFavorite(AppCommonList.products[index]);
                          print("On Tap");
                        },
                        icon: Icon(
                          Icons.favorite,
                          color:
                              Provider.of<HomeProvider>(context, listen: true)
                                      .favoriteList
                                      .contains((AppCommonList.products[index]))
                                  ? Colors.red
                                  : Colors.grey,
                        )),
                  ),
                );
              },
              separatorBuilder: ((context, index) {
                return const Divider(
                  // height: 10,
                  thickness: 1,
                  color: Colors.grey,
                );
              }),
              itemCount: AppCommonList.products.length),
        )
      ]),
    );
  }
}

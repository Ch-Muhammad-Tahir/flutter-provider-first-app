import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/home_provider.dart';

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
              print("Elevated Icon button Pressed");
            },
            icon: const Icon(Icons.favorite),
            label: Text(
                "Go To My List (${Provider.of<HomeProvider>(context, listen: true).favoriteList.length})")),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              // physics: ,
              itemBuilder: (context, index) {
                return ListTile(
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
                        // if (Provider.of<HomeProvider>(context, listen: false)
                        //     .favoriteList
                        //     .contains((AppCommonList.products[index]))) {
                        //   Provider.of<HomeProvider>(context, listen: false)
                        //       .favoriteList
                        //       .remove((AppCommonList.products[index]));
                        // } else {
                        //   Provider.of<HomeProvider>(context, listen: false)
                        //       .addToFavorite(AppCommonList.products[index]);
                        // }

                        // Provider.of<HomeProvider>(context, listen: true)
                        //         .favoriteList
                        //         .contains((AppCommonList.products[index]))

                        print("On Tap");
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Provider.of<HomeProvider>(context, listen: true)
                                .favoriteList
                                .contains((AppCommonList.products[index]))
                            ? Colors.red
                            : Colors.grey,
                      )),
                );
              },
              separatorBuilder: ((context, index) {
                return const Divider(
                  // height: 10,
                  thickness: 2,
                  color: Colors.grey,
                );
              }),
              itemCount: AppCommonList.products.length),
        )
      ]),
    );
  }
}

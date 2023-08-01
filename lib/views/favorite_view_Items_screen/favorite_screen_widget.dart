import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/home_provider.dart';

class FavoriteScreenWidget extends StatelessWidget {
  const FavoriteScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite List")),
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, provider, child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  color: Colors.green[100],
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    title: Text(
                      provider.favoriteList[index].productTitle,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                        child: Text(provider.favoriteList[index].prodcutPrice)),
                    trailing: TextButton(
                      child: const Text(
                        "Remove",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        provider
                            .removeFromFavorite(provider.favoriteList[index]);
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                );
              },
              itemCount: provider.favoriteList.length);
        },
      ),
    );
  }
}

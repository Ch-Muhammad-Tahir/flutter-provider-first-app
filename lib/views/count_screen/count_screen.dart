import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/count_provider.dart';

class CountScreenWidegt extends StatelessWidget {
  const CountScreenWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Provider Example"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<CountProvier>(context, listen: false).addIncrement();
          },
          child: const Text("+"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("hay This Is Provider"),
            Consumer<CountProvier>(
              builder: (context, provider, child) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Value is ${provider.count} ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    ]);
              },
            )
          ],
        ));
  }
}

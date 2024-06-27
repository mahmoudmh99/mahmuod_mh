import 'package:flutter/material.dart';
import 'package:search/model/data_model.dart';
import 'package:search/service/Animal_service.dart';
import 'package:search/view/serch_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchUi(),
    );
  }
}

class HomPage extends StatelessWidget {
  List<AinmalModel> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getDataofAnimal(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              searchResult = snapshot.data!;
              return StatefulBuilder(builder: (context, StepState) {
                return Column(
                  children: [
                    TextField(
                      // decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(200))),
                      onChanged: (value) {
                        searchResult = [];
                        StepState(() {
                          snapshot.data!.forEach((element) {
                            if (element.name.contains(value)) {
                              searchResult.add(element);
                            }
                          });
                        });
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: searchResult!.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(searchResult![index].name),
                          leading: Image.network(searchResult![index].image),
                          subtitle: Text(searchResult![index].family),
                        ),
                      ),
                    ),
                  ],
                );
              });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

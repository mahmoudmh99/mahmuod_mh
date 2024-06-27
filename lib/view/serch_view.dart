import 'package:flutter/material.dart';
import 'package:search/service/Animal_service.dart';

class SearchUi extends StatefulWidget {
  SearchUi({super.key});
  @override
  State<SearchUi> createState() => _SearchUiState();
}

class _SearchUiState extends State<SearchUi> {
  String lexem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: TextField(
            decoration: InputDecoration(
                hintText: "write here",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100))),
            onChanged: (value) {
              setState(() {
                lexem = value;
              });
            },
          ),
        ),
      ),
      body: FutureBuilder(
        future: serchInAnimal(lexem: lexem),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(snapshot.data![index].name),
                leading: Image.network(snapshot.data![index].image),
                subtitle: Text(snapshot.data![index].family),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

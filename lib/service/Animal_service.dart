
import 'package:dio/dio.dart';
import 'package:search/model/data_model.dart';

Future<List<AinmalModel>> getDataofAnimal() async {
  Dio dio = Dio();
  Response response = await dio.get("https://freetestapi.com/api/v1/animals");
  if (response.statusCode == 200) {
    List<AinmalModel> animal = [];
    for (var i = 0; i < response.data.length; i++) {
      animal.add(AinmalModel.fromMap(response.data[i]));
    }
    return animal;
  } else {
    return [];
  }
}

Future<List<AinmalModel>> serchInAnimal({String lexem = ''}) async {
  Dio dio = Dio();
  Response response = await dio.get("https://freetestapi.com/api/v1/animals?search=${lexem}");
  if (response.statusCode == 200) {
    List<AinmalModel> animal = [];
    for (var i = 0; i < response.data.length; i++) {
      animal.add(AinmalModel.fromMap(response.data[i]));
    }
    return animal;
  } else {
    return [];
  }
}


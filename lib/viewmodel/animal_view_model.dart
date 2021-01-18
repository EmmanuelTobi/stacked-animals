import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/model/animals.dart';
import 'dart:convert' as JSON;

class AnimalDataViewModel extends FutureViewModel<AnimalModel> {

  BuildContext buildContext;

  AnimalDataViewModel({this.buildContext});

  Future<AnimalModel> loadFromJsonData() async {

    print("hello");

    String data = await DefaultAssetBundle.of(this.buildContext).loadString("assets/animal.json");
    return AnimalModel.fromJson(JSON.json.decode(data));

  }

  @override
  void onError(error) {

    print(error.toString());

  }

  @override
  Future<AnimalModel> futureToRun() => loadFromJsonData();
}

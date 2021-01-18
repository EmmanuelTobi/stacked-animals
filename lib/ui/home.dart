import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/viewmodel/animal_view_model.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AnimalDataViewModel>.reactive(
      viewModelBuilder: () => AnimalDataViewModel(buildContext: context),
      builder: (_, model, child) {

        return Scaffold(
            body: model.hasError
                ? Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(
                      'An error has occered while running the future',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Center(
                    child: model.isBusy
                        ? CircularProgressIndicator()
                        : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(height: 200,),
                              Row(
                                children: [
                                  Text("Stacked Animals", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),),
                                ],
                              ),
                              ListView.builder(
                                  itemCount: model.data.animals.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int position){
                                return GestureDetector(
                                    onTap: () {
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(model.data.animals[position].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                          Text(model.data.animals[position].size, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                                        ],
                                      ),
                                    )
                                );
                              }
                              ),
                            ],
                          ),
                        ),
                  ),
          );
        }

    );
  }
}
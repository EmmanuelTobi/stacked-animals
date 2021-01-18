class AnimalModel {
  List<Animals> animals;

  AnimalModel({this.animals});

  AnimalModel.fromJson(Map<String, dynamic> json) {
    if (json['animals'] != null) {
      animals = new List<Animals>();
      json['animals'].forEach((v) {
        animals.add(new Animals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.animals != null) {
      data['animals'] = this.animals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Animals {
  String name;
  String size;
  String timeadded;

  Animals({this.name, this.size, this.timeadded});

  Animals.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = json['size'];
    timeadded = json['timeadded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['size'] = this.size;
    data['timeadded'] = this.timeadded;
    return data;
  }
}
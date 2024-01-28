class Task {
  int? id;
  String? inStock;
  String? foodName;
  int? kg;
  String? image;
  int? actualPrice;
  int? saveMoney;
  String? plastic;
  String? off;


  Task({
    this.id,
    this.inStock,
    this.foodName,
    this.kg,
    this.image,
    this.actualPrice,
    this.saveMoney,
    this.plastic,
    this.off
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'inStock': inStock,
      'foodName': foodName,
      'actualPrice': actualPrice,
      'saveMoney': saveMoney,
      'plastic': plastic,
      'kg': kg,
      'image': image,
      'off': off,
    };
  }

  Task.fromMap(Map<String, dynamic> task){
    id =  task['id'];
    inStock = task['inStock'];
    foodName = task['foodName'];
    actualPrice = task['actualPrice'];
    saveMoney = task['saveMoney'];
    plastic = task['plastic'];
    kg = task['kg'];
    image = task['image'];
    off = task['off'];

  }
}

import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveUtil {
  static Box<int>? _likedClothesBox;
  static Box<int>? _cartClothesBox;
  static const String _likedClothesData = "likedClothesData";
  static const String _cartClothesData = "cartClothesData";

  Future<void> init() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Directory directory =
        await Directory(appDocDirectory.path + '/' + "clothesData").create();
    Hive.init(directory.path);
    // Hive.registerAdapter(ClothesProductAdapter());
    _likedClothesBox = await Hive.openBox<int>(_likedClothesData);
    _cartClothesBox = await Hive.openBox<int>(_cartClothesData);
  }

  List<int> getLikePrductList() {
    return _likedClothesBox?.values.toList() ?? [];
  }

  List<int> getCartPrductList() {
    return _cartClothesBox?.values.toList() ?? [];
  }

  void likeProductHandle({required int productID, required int index}) {
    if (_likedClothesBox!.containsKey(index)) {
      _likedClothesBox!.delete(index);
    } else {
      _likedClothesBox!.put(index, productID);
    }
  }

  void cartProductHandle({required int productID, required int index}) {
    if (_cartClothesBox!.containsKey(index)) {
      _cartClothesBox!.delete(index);
    } else {
      _cartClothesBox!.put(index, productID);
    }
  }
}

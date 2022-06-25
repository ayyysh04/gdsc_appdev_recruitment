import 'package:gdsc_appdev/view_models/base_view_model/base_model.dart';

class IndexTrackingModel extends BaseModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _reverse = false;

  bool get reverse => _reverse;

  void setIndex(int value) {
    if (value < _currentIndex) {
      _reverse = true;
    } else {
      _reverse = false;
    }
    _currentIndex = value;
    notifyListeners();
  }

  bool isIndexSelected(int index) => _currentIndex == index;
}

import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  
  
  @observable
  ObservableList myList = ObservableList.of([]);
  @computed
  get length => myList.length;

  @action
  void add(String name, String phone) {
    myList.add({'name': name, 'phone': phone});
    print(myList);
  }

  @action
  void remove(int index) {
    myList.removeAt(index);
  }
}





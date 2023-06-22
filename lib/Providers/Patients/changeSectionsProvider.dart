import 'package:fluent_ui/fluent_ui.dart';

/*
class ChangeSectionsProvider extends ChangeNotifier{
  static bool _mode=false;
  static List<int> _selected=[0];
  static int _selectedMenuNum=0;

  List<int> get slected => _selected;
  int get selectedMenuNum => _selectedMenuNum;
  bool get mode => _mode;

  setSelected(List<int> value){
    _selected=value;
    notifyListeners();
  }

  setSelectedNum(int value){
    _selectedMenuNum=value;
    notifyListeners();
  }

  setMode(bool value){
    _mode=value;
    notifyListeners();
  }
}
*/

class ChangeSectionsProvider extends ChangeNotifier{
  static int theKey=0;
  static int currentIndex = 0;
  static List<Tab> tabs = [];
  static List<PatientUi> patientUiList=[];
  
  int findIndex(int key){
    for(int i=0;i<patientUiList.length;i++){
      if(patientUiList[i].key==key){
        return i;
      }
    }
    return 0;
  }
  
  int getCurrentIndex()=>currentIndex;
  List<Tab> getTabs()=>tabs;

  List<PatientUi> get thePatientUiList => patientUiList;
  int getPatientId(key) => patientUiList[findIndex(key)].patientId;
  List<int> getSelected(key) => patientUiList[findIndex(key)].selected;
  int getSelectedMenuNum(key) => patientUiList[findIndex(key)].selectedMenuNum;
  bool getMode(key) => patientUiList[findIndex(key)].mode;
  PageController getPage(key) => patientUiList[findIndex(key)].page;

  setCurrentIndex(int value) {
    currentIndex=value;
    notifyListeners();
  }

  addTab(Tab value){
    tabs.add(value);
    notifyListeners();
  }

  insertTab(int index,Tab element){
    tabs.insert(index, element);
    notifyListeners();
  }

  removeTab(Tab value){
    tabs.remove(value);
    notifyListeners();
  }

  Tab removeTabAtIndex(int index){
    Tab tab = tabs.removeAt(index);
    notifyListeners();
    return tab;
  }

  int addPatientUi(){
    patientUiList.add(PatientUi(key: theKey));
    notifyListeners();
    theKey++;
    return theKey -1;
  }

  removePatientUi(int key){
    patientUiList.removeAt(findIndex(key));
    notifyListeners();
  }

  setPatientUiList(List<PatientUi> value){
    patientUiList=value;
    notifyListeners();
  }

  setPatientId(int value,int key){
    patientUiList[findIndex(key)].patientId=value;
    notifyListeners();
  }

  setSelected(List<int> value,int key){
    patientUiList[findIndex(key)].selected=value;
    notifyListeners();
  }

  setSelectedNum(int value,int key){
    patientUiList[findIndex(key)].selectedMenuNum=value;
    notifyListeners();
  }

  setMode(bool value,int key){
    patientUiList[findIndex(key)].mode=value;
    notifyListeners();
  }

  setPage(int value,int key){
    patientUiList[findIndex(key)].page.jumpToPage(value);
    patientUiList[findIndex(key)].page=PageController(
      initialPage: value,
    );
    notifyListeners();
  }
}

class PatientUi{
  late int patientId;
  late bool mode;
  late List<int> selected=[0];
  late int selectedMenuNum;
  late PageController page = PageController(
    initialPage: 0,
  );
  late int key;

  PatientUi({this.patientId= -1,this.mode=false,this.selectedMenuNum=0,this.key=0});
}
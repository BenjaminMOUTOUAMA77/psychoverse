import 'package:fluent_ui/fluent_ui.dart';


class ChangeSectionsProvider extends ChangeNotifier{
  static int theKey=0;
  static int currentIndex = 0;
  static List<Tab> tabs = [];
  static List<PatientUi> patientUiList=[];
  
  int getCurrentIndex()=>currentIndex;
  List<Tab> getTabs()=>tabs;
  List<PatientUi> get thePatientUiList => patientUiList;

  int findIndex(int key){
    int value=0;
    for(int i=0;i<patientUiList.length;i++){
      if(patientUiList[i].key==key){
        value=i;
        break;
      }
    }
    return value;
  }

  int getPatientId(int key) => patientUiList[findIndex(key)].patientId;
  List<int> getSelected(int key) => patientUiList[findIndex(key)].selected;
  int getSelectedMenuNum(int key) => patientUiList[findIndex(key)].selectedMenuNum;
  bool getMode(int key) => patientUiList[findIndex(key)].mode;
  PageController getPage(int key) => patientUiList[findIndex(key)].page;

  int getSuiviCurrentIndex(int key)=>patientUiList[findIndex(key)].suiviCurrentIndex;
  List<Tab> getSuiviTabs(int key)=>patientUiList[findIndex(key)].suiviTabs;
  PageController getSuiviPage(int key,int suiviKey) => patientUiList[findIndex(key)].getSuiviPage(suiviKey);

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


  addSuiviTab(Tab value,int key){
    patientUiList[findIndex(key)].suiviTabs.add(value);
    notifyListeners();
  }

  insertSuiviTab(int index,Tab element,int key){
    patientUiList[findIndex(key)].suiviTabs.insert(index, element);
    notifyListeners();
  }

  removeSuiviTab(Tab value,int key){
    patientUiList[findIndex(key)].suiviTabs.remove(value);
    notifyListeners();
  }

  Tab removeSuiviTabAtIndex(int index,int key){
    Tab tab = patientUiList[findIndex(key)].suiviTabs.removeAt(index);
    notifyListeners();
    return tab;
  }


  setSuiviCurrentIndex(int value,int key) {
    patientUiList[findIndex(key)].suiviCurrentIndex=value;
    notifyListeners();
  }
  setSuiviPage(int value,int key,int suiviKey){
    patientUiList[findIndex(key)].setSuiviPage(value, suiviKey);
    notifyListeners();
  }

  int addSuiviUi(int key,){
    return patientUiList[findIndex(key)].addSuiviUi();
  }
  removeSuiviUi(int key, int suiviKey){
    patientUiList[findIndex(key)].removeSuiviUi(suiviKey);
    notifyListeners();
  }
}
class PatientUi{
  static int theSuiviKey=0;
  late int patientId;
  late bool mode;
  late List<int> selected=[0];
  late int selectedMenuNum;
  late PageController page = PageController(
    initialPage: 0,
  );
  late int key;

  late int suiviCurrentIndex=0;
  late List<Tab> suiviTabs = [];
  static List<SuiviUi> suivisUis=[];

  List<SuiviUi> getSuiviUis()=>suivisUis;
  int findSuiviIndex(int key){
    int value=0;
    for(int i=0;i<suivisUis.length;i++){
      if(suivisUis[i].key==key){
        value=i;
        break;
      }
    }
    return value;
  }
  PageController getSuiviPage(int suiviKey)=>suivisUis[findSuiviIndex(suiviKey)].suiviPage;

  setSuiviPage(int value,int suiviKey){
    suivisUis[findSuiviIndex(suiviKey)].suiviPage.jumpToPage(value);
    suivisUis[findSuiviIndex(suiviKey)].suiviPage=PageController(
      initialPage: value,
    );
  }

  int addSuiviUi(){
    suivisUis.add(SuiviUi(key: theSuiviKey));
    theSuiviKey++;
    return theSuiviKey -1;
  }
  removeSuiviUi(int key){
    suivisUis.removeAt(findSuiviIndex(key));
  }

  PatientUi({this.patientId= -1,this.mode=false,this.selectedMenuNum=0,this.key=0});
}

class SuiviUi{
  int key;
  PageController suiviPage=PageController(
    initialPage: 0,
  );
  SuiviUi({required this.key});
}


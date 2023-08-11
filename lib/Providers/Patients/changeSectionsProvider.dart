import 'package:fluent_ui/fluent_ui.dart';

class ChangeSectionsProvider extends ChangeNotifier{
  static int theKey=0;
  static int currentIndex = 0;
  static List<Tab> tabs = [];
  static List<PatientUi> patientUiList=[];

  // Patient TabView Manage
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

  int getCurrentIndex()=>currentIndex;
  setCurrentIndex(int value) {
    currentIndex=value;
    notifyListeners();
  }

  List<Tab> getTabs()=>tabs;
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


// PatientUI Manage
  List<PatientUi> get thePatientUiList => patientUiList;
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
  int getPatientId(int key) => patientUiList[findIndex(key)].patientId;
  setPatientId(int value,int key){
    patientUiList[findIndex(key)].patientId=value;
    notifyListeners();
  }

  List<int> getSelected(int key) => patientUiList[findIndex(key)].selected;
  setSelected(List<int> value,int key){
    patientUiList[findIndex(key)].selected=value;
    notifyListeners();
  }

  int getSelectedMenuNum(int key) => patientUiList[findIndex(key)].selectedMenuNum;
  setSelectedNum(int value,int key){
    patientUiList[findIndex(key)].selectedMenuNum=value;
    notifyListeners();
  }

  bool getMode(int key) => patientUiList[findIndex(key)].mode;
  setMode(bool value,int key){
    patientUiList[findIndex(key)].mode=value;
    notifyListeners();
  }

  PageController getPage(int key) => patientUiList[findIndex(key)].page;
  setPage(int value,int key){
    patientUiList[findIndex(key)].page.jumpToPage(value);
    patientUiList[findIndex(key)].page=PageController(
      initialPage: value,
    );
    notifyListeners();
  }


  // Suivi TabView Manage
  int findSuiviIndex(int key,int uiKey){
    int value=0;
    for(int i=0;i<patientUiList[findIndex(uiKey)].getSuiviUis().length;i++){
      if(patientUiList[findIndex(uiKey)].getSuiviUis()[i].key==key){
        value=i;
        break;
      }
    }
    return value;
  }

  int getSuiviCurrentIndex(int key)=>patientUiList[findIndex(key)].suiviCurrentIndex;
  setSuiviCurrentIndex(int value,int key) {
    patientUiList[findIndex(key)].suiviCurrentIndex=value;
    notifyListeners();
  }

  List<Tab> getSuiviTabs(int key)=>patientUiList[findIndex(key)].suiviTabs;
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

  PageController getSuiviPage(int key,int suiviKey) => patientUiList[findIndex(key)].getSuiviPage(suiviKey);
  setSuiviPage(int value,int key,int suiviKey){
    patientUiList[findIndex(key)].setSuiviPage(value, suiviKey);
    notifyListeners();
  }

  // SuiviUi Manage
  int addSuiviUi(int key,){
    return patientUiList[findIndex(key)].addSuiviUi();
  }
  removeSuiviUi(int key, int suiviKey){
    patientUiList[findIndex(key)].removeSuiviUi(suiviKey);
    notifyListeners();
  }


  // Formulaire TabView Manage
  int findFormulaireIndex(int key,int uiKey){
    int value=0;
    for(int i=0;i<patientUiList[findIndex(uiKey)].getFormulaireUis().length;i++){
      if(patientUiList[findIndex(uiKey)].getFormulaireUis()[i].key==key){
        value=i;
        break;
      }
    }
    return value;
  }

  int getFormulaireCurrentIndex(int key)=>patientUiList[findIndex(key)].formulaireCurrentIndex;
  setFormulaireCurrentIndex(int value,int key) {
    patientUiList[findIndex(key)].formulaireCurrentIndex=value;
    notifyListeners();
  }

  List<Tab> getFormulaireTabs(int key)=>patientUiList[findIndex(key)].formulairesTabs;
  addFormulaireTab(Tab value,int key){
    patientUiList[findIndex(key)].formulairesTabs.add(value);
    notifyListeners();
  }
  insertFormulaireTab(int index,Tab element,int key){
    patientUiList[findIndex(key)].formulairesTabs.insert(index, element);
    notifyListeners();
  }
  removeFormulaireTab(Tab value,int key){
    patientUiList[findIndex(key)].formulairesTabs.remove(value);
    notifyListeners();
  }
  Tab removeFormulaireTabAtIndex(int index,int key){
    Tab tab = patientUiList[findIndex(key)].formulairesTabs.removeAt(index);
    notifyListeners();
    return tab;
  }

  PageController getFormulairePage(int key,int formulaireKey) => patientUiList[findIndex(key)].getFormulairePage(formulaireKey);
  setFormulairePage(int value,int key,int formulaireKey){
    patientUiList[findIndex(key)].setFormulairePage(value, formulaireKey);
    notifyListeners();
  }

  // FormulaireUi Manage
  int addFormulaireUi(int key,){
    return patientUiList[findIndex(key)].addFormulaireUi();
  }
  removeFormulaireUi(int key, int formulaireKey){
    patientUiList[findIndex(key)].removeFormulaireUi(formulaireKey);
    notifyListeners();
  }
}

class PatientUi{
  late int key;
  late int patientId;
  late bool mode;
  late List<int> selected=[0];
  late int selectedMenuNum;
  late PageController page = PageController(
    initialPage: 0,
  );

  //Suivis Attributes
  static int theSuiviKey=0;
  late int suiviCurrentIndex=0;
  late List<Tab> suiviTabs = [];
  static List<SuiviUi> suivisUis=[];

  //Suivis Attributes
  static int theFormulaireKey=-1;
  late int formulaireCurrentIndex=0;
  late List<Tab> formulairesTabs = [];
  static List<FormulaireUi> formulairesUis=[];

  // Suivis functions
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

  List<SuiviUi> getSuiviUis()=>suivisUis;
  int addSuiviUi(){
    suivisUis.add(SuiviUi(key: theSuiviKey));
    theSuiviKey++;
    return theSuiviKey -1;
  }
  removeSuiviUi(int key){
    suivisUis.removeAt(findSuiviIndex(key));
  }

  PageController getSuiviPage(int suiviKey)=>suivisUis[findSuiviIndex(suiviKey)].suiviPage;
  setSuiviPage(int value,int suiviKey){
    suivisUis[findSuiviIndex(suiviKey)].suiviPage.jumpToPage(value);
    suivisUis[findSuiviIndex(suiviKey)].suiviPage=PageController(
      initialPage: value,
    );
  }

  // Formulairess functions
  int findFormulaireIndex(int key){
    int value=0;
    for(int i=0;i<formulairesUis.length;i++){
      if(formulairesUis[i].key==key){
        value=i;
        break;
      }
    }
    return value;
  }

  List<FormulaireUi> getFormulaireUis()=>formulairesUis;
  int addFormulaireUi(){
    formulairesUis.add(FormulaireUi(key: theFormulaireKey));
    theFormulaireKey++;
    return theFormulaireKey -1;
  }
  removeFormulaireUi(int key){
    formulairesUis.removeAt(findFormulaireIndex(key));
  }

  PageController getFormulairePage(int formulaireKey)=>formulairesUis[findFormulaireIndex(formulaireKey)].formulairePage;
  setFormulairePage(int value,int formulaireKey){
    formulairesUis[findFormulaireIndex(formulaireKey)].formulairePage.jumpToPage(value);
    formulairesUis[findFormulaireIndex(formulaireKey)].formulairePage=PageController(
      initialPage: value,
    );
  }

  PatientUi({this.patientId= 0,this.mode=false,this.selectedMenuNum=0,this.key=0});
}

class SuiviUi{
  int key;
  int suiviId;
  PageController suiviPage=PageController(
    initialPage: 0,
  );
  SuiviUi({required this.key,this.suiviId=0});
}

class FormulaireUi{
  int key;
  int formulaireId;
  PageController formulairePage=PageController(
    initialPage: 0,
  );
  FormulaireUi({required this.key,this.formulaireId=0});
}

import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Screens/Patients/patients.dart';

class MainPatient extends StatefulWidget {
  const MainPatient({Key? key}) : super(key: key);

  @override
  State<MainPatient> createState() => _MainPatientState();
}

class _MainPatientState extends State<MainPatient> {
  late ChangeSectionsProvider patientUI;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    patientUI=Provider.of<ChangeSectionsProvider>(context);

    Tab generateTab(int index, key) {
      late Tab tab;
      tab = Tab(
        text: Text('Document $index'),
        semanticLabel: 'Document #$index',
        body: new Patients(uiIndex: key,),
        onClosed: () {
          if(this.mounted){
            setState(() {
              patientUI.removeTab(tab);
              patientUI.removePatientUi(key);
              if (patientUI.getCurrentIndex() > 0){patientUI.setCurrentIndex(patientUI.getCurrentIndex() -1);}
              print("CurrentIndex:${patientUI.getCurrentIndex()}  key:$key UILenght:${patientUI.thePatientUiList.length}  tabs.length : ${patientUI.getTabs().length}");
            });
          }

        },
      );
      return tab;
    }
    addTab(){
      setState(() {
        int key=patientUI.addPatientUi();
        final index = patientUI.getTabs().length;
        final tab = generateTab(index,key);
        patientUI.addTab(tab);
        print("UiIndex : ${patientUI.findIndex(key)}  UIKey:$key UILenght:${patientUI.thePatientUiList.length}  tabs.length : ${patientUI.getTabs().length} ");
      });
    }
    onReorder(oldIndex, newIndex){
      setState(() {
        if (oldIndex < newIndex) {
          print("TheNewIndex : $newIndex    TheOld : $oldIndex, UILenght:${patientUI.thePatientUiList.length}  tabs.length : ${patientUI.getTabs().length} ");
          newIndex -= 1;
        }
        final item = patientUI.removeTabAtIndex(oldIndex);
        patientUI.insertTab(newIndex, item);

        if (patientUI.getCurrentIndex() == newIndex) {
          patientUI.setCurrentIndex(oldIndex);
        } else if (patientUI.getCurrentIndex() == oldIndex) {
          patientUI.setCurrentIndex(newIndex);
        }
      });
    }
    if(patientUI.getTabs().isEmpty){addTab();}

    return TabView(
      tabs: patientUI.getTabs(),
      currentIndex: patientUI.getCurrentIndex(),
      onChanged: (index) => setState(() {print("Index : $index, UILenght:${patientUI.thePatientUiList.length}  tabs.length : ${patientUI.getTabs().length} ");patientUI.setCurrentIndex(index);}),
      tabWidthBehavior: TabWidthBehavior.equal,
      closeButtonVisibility: CloseButtonVisibilityMode.always,
      showScrollButtons: true,
      onNewPressed: () {
        addTab();
      },
      onReorder: (oldIndex, newIndex) {
        onReorder(oldIndex, newIndex);
      },
    );
  }
}

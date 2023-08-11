import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/Suivi/suivis.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class MainSuivis extends StatefulWidget {
  final int uiKey;
  const MainSuivis({Key? key,this.uiKey=0}) : super(key: key);

  @override
  State<MainSuivis> createState() => _MainSuivisState();
}

class _MainSuivisState extends State<MainSuivis> {
  late ChangeSectionsProvider sections;
  List<String> suivis = [
    "Suivi 1",
    "Suivi 2",
    "Suivi 3",
    "Suivi 4",
    "Suivi 5",
    "Suivi 1",
    "Suivi 2",
    "Suivi 3",
    "Suivi 4",
    "Suivi 5",
  ];

  @override
  Widget build(BuildContext context) {

    sections=Provider.of<ChangeSectionsProvider>(context);

    Tab generateTab(int index,int suiviIndex) {
      late Tab tab;
      tab = Tab(
        icon: Icon(FluentIcons.arrange_send_backward,color: AppColors.grisLite,),
        text: Text('Suivi $index'),
        semanticLabel: 'Suivi #$index',
        body: Suivis(uiKey: widget.uiKey,suiviUiKey: suiviIndex,),
        onClosed: () {
          if(this.mounted){
            setState(() {
              sections.removeSuiviTab(tab,widget.uiKey);
              sections.removeSuiviUi(widget.uiKey, suiviIndex);
              if (sections.getSuiviCurrentIndex(widget.uiKey) > 0){sections.setSuiviCurrentIndex(sections.getCurrentIndex() -1,widget.uiKey);}
            });
          }else{
            print("Impossible");
            sections.removeSuiviTab(tab,widget.uiKey);
            sections.removeSuiviUi(widget.uiKey, suiviIndex);
            if (sections.getSuiviCurrentIndex(widget.uiKey) > 0){sections.setSuiviCurrentIndex(sections.getCurrentIndex() -1,widget.uiKey);}
            print("UiIndex : ${sections.findIndex(widget.uiKey)}");
          }

        },
      );
      return tab;
    }
    addTab(){
      setState(() {
        sections.addSuiviTab(generateTab(sections.getSuiviTabs(widget.uiKey).length,sections.addSuiviUi(widget.uiKey)),widget.uiKey);
      });
    }
    onReorder(oldIndex, newIndex){
      setState(() {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = sections.removeSuiviTabAtIndex(oldIndex,widget.uiKey);
        sections.insertSuiviTab(newIndex, item,widget.uiKey);

        if (sections.getSuiviCurrentIndex(widget.uiKey) == newIndex) {
          sections.setSuiviCurrentIndex(oldIndex,widget.uiKey);
        } else if (sections.getSuiviCurrentIndex(widget.uiKey) == oldIndex) {
          sections.setSuiviCurrentIndex(newIndex,widget.uiKey);
        }
      });
    }
    if(sections.getSuiviTabs(widget.uiKey).isEmpty){addTab();}

    return Bloc1(
      uiKey: widget.uiKey,
      icon: FluentIcons.care_plan,
      title: "Suivis",
      number: 10,
      child: SizedBox(
        width: double.infinity,
        height: 720.h,
        child: TabView(
          tabs: sections.getSuiviTabs(widget.uiKey),
          currentIndex: sections.getSuiviCurrentIndex(widget.uiKey),
          onChanged: (index)=>sections.setSuiviCurrentIndex(index,widget.uiKey),
          tabWidthBehavior: TabWidthBehavior.equal,
          closeButtonVisibility: CloseButtonVisibilityMode.onHover,
          showScrollButtons: true,
          onNewPressed: () {
            addTab();
          },
          onReorder: (oldIndex, newIndex) {
            onReorder(oldIndex, newIndex);
          },
        ),
      ),
    );
  }
}

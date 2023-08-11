import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/Formulaire/formulaires.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc1.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class MainFormulaire extends StatefulWidget {
  final int uiKey;
  const MainFormulaire({Key? key,this.uiKey=0}) : super(key: key);

  @override
  State<MainFormulaire> createState() => _MainFormulaireState();
}

class _MainFormulaireState extends State<MainFormulaire> {
  late ChangeSectionsProvider sections;
  List<String> formulaires = [
    "Formulaire 1",
    "Formulaire 2",
    "Formulaire 3",
    "Formulaire 4",
    "Formulaire 5",
    "Formulaire 1",
    "Formulaire 2",
    "Formulaire 3",
    "Formulaire 4",
    "Formulaire 5",
  ];
  @override
  Widget build(BuildContext context) {
    sections=Provider.of<ChangeSectionsProvider>(context);

    Tab generateTab(int index,int formulaireIndex) {
      late Tab tab;
      tab = Tab(
        icon: Icon(FluentIcons.arrange_send_backward,color: AppColors.grisLite,),
        text: Text('Formulaire $index'),
        semanticLabel: 'Formulaire #$index',
        body: Formulaires(uiKey: widget.uiKey,formulaireUiKey: formulaireIndex,),
        onClosed: () {
          if(this.mounted){
            setState(() {
              sections.removeFormulaireTab(tab,widget.uiKey);
              sections.removeFormulaireUi(widget.uiKey, formulaireIndex);
              if (sections.getFormulaireCurrentIndex(widget.uiKey) > 0){sections.setFormulaireCurrentIndex(sections.getCurrentIndex() -1,widget.uiKey);}
            });
          }else{
            print("Impossible");
            sections.removeFormulaireTab(tab,widget.uiKey);
            sections.removeFormulaireUi(widget.uiKey, formulaireIndex);
            if (sections.getFormulaireCurrentIndex(widget.uiKey) > 0){sections.setFormulaireCurrentIndex(sections.getCurrentIndex() -1,widget.uiKey);}
          }

        },
      );
      return tab;
    }
    addTab(){
      setState(() {
        sections.addFormulaireTab(generateTab(sections.getFormulaireTabs(widget.uiKey).length,sections.addFormulaireUi(widget.uiKey)),widget.uiKey);
      });
    }
    onReorder(oldIndex, newIndex){
      setState(() {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = sections.removeFormulaireTabAtIndex(oldIndex,widget.uiKey);
        sections.insertFormulaireTab(newIndex, item,widget.uiKey);

        if (sections.getFormulaireCurrentIndex(widget.uiKey) == newIndex) {
          sections.setFormulaireCurrentIndex(oldIndex,widget.uiKey);
        } else if (sections.getFormulaireCurrentIndex(widget.uiKey) == oldIndex) {
          sections.setFormulaireCurrentIndex(newIndex,widget.uiKey);
        }
      });
    }
    if(sections.getFormulaireTabs(widget.uiKey).isEmpty){addTab();}

    return Bloc1(
      uiKey: widget.uiKey,
      icon: FluentIcons.care_plan,
      title: "Formulaire",
      number: 10,
      child: SizedBox(
        width: double.infinity,
        height: 720.h,
        child: TabView(
          tabs: sections.getFormulaireTabs(widget.uiKey),
          currentIndex: sections.getFormulaireCurrentIndex(widget.uiKey),
          onChanged: (index)=>sections.setFormulaireCurrentIndex(index,widget.uiKey),
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

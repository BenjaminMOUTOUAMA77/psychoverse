import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/Suivi/suivis.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer1.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class MainSuivis extends StatefulWidget {
  final int uiKey;
  const MainSuivis({Key? key, this.uiKey = 0}) : super(key: key);

  @override
  State<MainSuivis> createState() => _MainSuivisState();
}

class _MainSuivisState extends State<MainSuivis> {
  late ChangeSectionsProvider sections;
  List<String> suivis = [
    "Problème 1",
    "Problème 2",
    "Problème 3",
    "Problème 4",
    "Problème 5",
    "Problème 1",
    "Problème 2",
    "Problème 3",
    "Problème 4",
    "Problème 5",
  ];

  @override
  Widget build(BuildContext context) {
    sections = Provider.of<ChangeSectionsProvider>(context);

    Tab generateTab(int index, int tabSuiviUiKey) {
      late Tab tab;
      tab = Tab(
        icon: Icon(
          FluentIcons.arrange_send_backward,
          color: AppColors.grisLite,
        ),
        text: Text('Problème $index'),
        semanticLabel: 'Problème #$index',
        body: Suivis(
          uiKey: widget.uiKey,
          suiviUiKey: tabSuiviUiKey,
        ),
        onClosed: () {
          void closeFunction() {
            if (sections.getSuiviCurrentIndex(widget.uiKey) > 0) {
              if (sections.findSuiviIndex(tabSuiviUiKey, widget.uiKey) <=
                  sections.getSuiviCurrentIndex(widget.uiKey)) {
                sections.setSuiviCurrentIndex(
                    sections.getSuiviCurrentIndex(widget.uiKey) - 1,
                    widget.uiKey);
              }
            } else {
              if(sections.getSuiviTabs(widget.uiKey).length==1){
                sections.setSuiviPage(0, widget.uiKey, tabSuiviUiKey);
              }
            }
            sections.removeSuiviTab(tab, widget.uiKey);
            sections.removeSuiviUi(widget.uiKey, tabSuiviUiKey);
          }

          if (this.mounted) {
            setState(() {
              closeFunction();
            });
          } else {
            closeFunction();
          }
        },
      );
      return tab;
    }

    addTab() {
      setState(() {
        int suiviUiKey = sections.addSuiviUi(widget.uiKey);
        sections.addSuiviTab(
            generateTab(sections.getSuiviTabs(widget.uiKey).length,suiviUiKey),
            widget.uiKey);
        sections.setSuiviCurrentIndex(sections.findSuiviIndex(suiviUiKey, widget.uiKey), widget.uiKey);
      });
    }

    onReorder(oldIndex, newIndex) {
      setState(() {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = sections.removeSuiviTabAtIndex(oldIndex, widget.uiKey);
        sections.insertSuiviTab(newIndex, item, widget.uiKey);

        if (sections.getSuiviCurrentIndex(widget.uiKey) == newIndex) {
          sections.setSuiviCurrentIndex(oldIndex, widget.uiKey);
        } else if (sections.getSuiviCurrentIndex(widget.uiKey) == oldIndex) {
          sections.setSuiviCurrentIndex(newIndex, widget.uiKey);
        }
      });
    }

    if (sections.getSuiviTabs(widget.uiKey).isEmpty) {
      addTab();
    }

    return AppContainer1(
      uiKey: widget.uiKey,
      icon: FluentIcons.care_plan,
      title: "Problèmes",
      number: 10,
      child: SizedBox(
        width: double.infinity,
        height: 720.h,
        child: TabView(
          tabs: sections.getSuiviTabs(widget.uiKey),
          currentIndex: sections.getSuiviCurrentIndex(widget.uiKey),
          onChanged: (index) => setState(() {
            sections.setSuiviCurrentIndex(index, widget.uiKey);
          }),
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

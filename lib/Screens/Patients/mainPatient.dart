import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Screens/Patients/patients.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';

class MainPatient extends StatefulWidget {
  const MainPatient({Key? key}) : super(key: key);

  @override
  State<MainPatient> createState() => _MainPatientState();
}

class _MainPatientState extends State<MainPatient> {
  late ChangeSectionsProvider sections;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sections = Provider.of<ChangeSectionsProvider>(context);

    Tab generateTab(int index, key) {
      late Tab tab;
      tab = Tab(
        icon: SvgPicture.asset(
          AppIcons.logoSymboleV,
          height: 25.h,
          color: AppColors.grisLite,
        ),
        text: Text('Document $key'),
        semanticLabel: 'Document #$key',
        body: Patients(
          uiKey: key,
        ),
        onClosed: () {
          void closeFunction(){
            if (sections.getCurrentIndex() > 0) {
              if(sections.findIndex(key)<=sections.getCurrentIndex()){
                sections.setCurrentIndex(sections.getCurrentIndex() - 1);
              }
            }else{
              if(sections.getTabs().length==1){
                sections.setPage(0,key);
              }
            }
            sections.removePatientUi(key);
            sections.removeTab(tab);
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
        int uikey = sections.addPatientUi();
        sections.addTab(
            generateTab(sections.getTabs().length,uikey));
        sections.setCurrentIndex(sections.findIndex(uikey));
      });
    }

    onReorder(oldIndex, newIndex) {
      setState(() {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = sections.removeTabAtIndex(oldIndex);
        sections.insertTab(newIndex, item);

        if (sections.getCurrentIndex() == newIndex) {
          sections.setCurrentIndex(oldIndex);
        } else if (sections.getCurrentIndex() == oldIndex) {
          sections.setCurrentIndex(newIndex);
        }
      });
    }

    if (sections.getTabs().isEmpty) {
      addTab();
    }

    return TabView(
      tabs: sections.getTabs(),
      currentIndex: sections.getCurrentIndex(),
      onChanged: (index) => sections.setCurrentIndex(index),
      tabWidthBehavior: TabWidthBehavior.equal,
      closeButtonVisibility: CloseButtonVisibilityMode.onHover,
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

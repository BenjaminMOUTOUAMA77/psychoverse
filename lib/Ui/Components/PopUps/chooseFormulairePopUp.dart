import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';

class ChooseFormulairePopUp extends StatefulWidget {
  const ChooseFormulairePopUp({Key? key}) : super(key: key);

  @override
  State<ChooseFormulairePopUp> createState() => _ChooseFormulairePopUpState();
}

class _ChooseFormulairePopUpState extends State<ChooseFormulairePopUp> {
  List<String> selectedContacts = [];
  List<String> contacts = ['Formulaire 1', 'Formulaire 2','Formulaire 3', 'Formulaire 4','Formulaire 5', 'Formulaire 6',];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile.selectable(
                  title: Text(contact),
                  selected: selectedContacts.contains(contact),
                  selectionMode: ListTileSelectionMode.multiple,
                  onSelectionChange: (selected) {
                    setState(() {
                      if (selected) {
                        selectedContacts.add(contact);
                      } else {
                        selectedContacts.remove(contact);
                      }
                    });
                  },
                );
              }
          ),
        ),
        Gap(30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleAppButon(texte: "Ajouter",function: (){
              Navigator.pop(context);
            }),
          ],
        ),
      ],
    );
  }
}

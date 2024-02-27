import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Models/patient.dart';
import 'package:psychoverse/Models/personne.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Blocs/newPersonne.dart';
import 'package:psychoverse/Ui/Components/Forms/searchBar.dart';
import 'package:psychoverse/Ui/Components/Lists/patientBoxList.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';

class PatientList extends StatefulWidget {
  int uiKey;
  PatientList({Key? key, this.uiKey = 0}) : super(key: key);

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  List<Personne> listPersonnes = [
    Personne(
      nom: "Bernard ALOWALOU",
      im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp1.jpeg",
    ),
    Personne(
    nom: "Jospin CRISPIN",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp2.jpeg",
  ),
  Personne(
  nom: "Lafia ZAKI",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp3.jpeg",
  ),
  Personne(
  nom: "Leni MAMA",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp4.jpeg",
  ),
  Personne(
  nom: "Otapoue DJIMA",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp5.jpeg",
  ),
  Personne(
  nom: "Aléola FEMI",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp6.jpeg",
  ),
  Personne(
  nom: "Richard OUGADOU",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp7.jpeg",
  ),

  Personne(
  nom: "Maimon DOSSOU",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp8.jpeg",
  ),
  Personne(
  nom: "Phillipe DJOM",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp1.jpeg",
  ),

  Personne(
  nom: "Atanoussi GONFIA",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp3.jpeg",
  ),
  Personne(
  nom: "Nathalie GHUEZO",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp4.jpeg",
  ),

  Personne(
  nom: "Lawin FARI",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp6.jpeg",
  ),


  Personne(
  nom: "Élisabeth TANTIKOUTE",
  im_profil: "D:\\4- Projets\\00- MemoireLicence\\ressources\\Images\\Autres\\imp1.jpeg",
  ),



  ];
  @override
  Widget build(BuildContext context) {
    ChangeSectionsProvider page = Provider.of<ChangeSectionsProvider>(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
            /*decoration: BoxDecoration(
              color: AppColors.blancGrise,
              boxShadow: [
                AppDesignEffects.shadow0,
              ],
            ),*/
            child: MakeSearchBar(
                withComboFilter: true,
                withToggleFilter: true,
                comboFilterList: ["Nom", "Ville", "Numero dossier"],
                textList: [
                  "Bernard ALOWALOU",
                  "Jospin CRISPIN",
                  "Lafia ZAKI",
                  "Leni MAMA",
                  "Otapoue DJIMA",
                  "Aléola FEMI"
                      "Richard OUGADOU",
                  "Maimon DOSSOU",
                  "Phillipe DJOM",
                  "Atanoussi GONFIA",
                  "Nathalie GHUEZO",
                  "Lawin FARI",
                  "Élisabeth TANTIKOUTE",
                ],
                toggleFilterList: [
                  "Tout",
                  "En Cours",
                  "En Pause",
                  "Archivés",
                ],
                onChanged: (
                    {toggleFilter = "", comboFilter = "", text = ""}) {},
                onFieldSubmitted: (
                    {toggleFilter = "", comboFilter = "", text = ""}) {
                  print(
                      "Text = $text  |   ComboFilter = $comboFilter  |  ToggleFilter = $toggleFilter");
                }),
          ),
          Gap(40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleAppButon(
                  texte: "Nouveau Dossier",
                  icon: FluentIcons.add_friend,
                  function: () => showDialog(
                    context: context,
                    builder: (context) => SmallPopUp(
                      title: "Nouveau Dossier",
                      child: NewPersonne(),
                      save: true,
                      saveTexte: "Créer",
                      saveFunction: () {},
                    ),
                  ),
                ),
                SimpleAppButon(
                  texte: "Importer / Exporter",
                  icon: FluentIcons.save_and_close,
                  function: () {},
                ),
              ],
            ),
          ),
          Gap(20.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: PatientBoxList(
                uiKey: widget.uiKey,
                list: listPersonnes,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

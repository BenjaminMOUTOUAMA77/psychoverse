import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/ArchitectureProvider/changeScreenProviderArchitecture.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/radioMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class ArchitectureFormulaireDetail extends StatefulWidget {
  const ArchitectureFormulaireDetail({Key? key}) : super(key: key);

  @override
  State<ArchitectureFormulaireDetail> createState() =>
      _ArchitectureFormulaireDetailState();
}

class _ArchitectureFormulaireDetailState extends State<ArchitectureFormulaireDetail> {
  late ArchitectureFormulairePagesManagerProvider sections;
  final items = [
    TreeViewItem(
      content: const Text('Personal Documents'),
      value: 'personal_docs',
      children: [
        TreeViewItem(
          content: const Text('Home Remodel'),
          value: 'home_remodel',
          children: [
            TreeViewItem(
              content: const Text('Contractor Contact Info'),
              value: 'contr_cont_inf',
            ),
            TreeViewItem(
              content: const Text('Paint Color Scheme'),
              value: 'paint_color_scheme',
            ),
            TreeViewItem(
              content: const Text('Flooring weedgrain type'),
              value: 'flooring_weedgrain_type',
            ),
            TreeViewItem(
              content: const Text('Kitchen cabinet style'),
              value: 'kitch_cabinet_style',
            ),
          ],
        ),
        TreeViewItem(
          content: const Text('Tax Documents'),
          value: 'tax_docs',
          children: [
            TreeViewItem(content: const Text('2017'), value: "tax_2017"),
            TreeViewItem(
              content: const Text('Middle Years'),
              value: 'tax_middle_years',
              children: [
                TreeViewItem(content: const Text('2018'), value: "tax_2018"),
                TreeViewItem(content: const Text('2019'), value: "tax_2019"),
                TreeViewItem(content: const Text('2020'), value: "tax_2020"),
              ],
            ),
            TreeViewItem(content: const Text('2021'), value: "tax_2021"),
            TreeViewItem(content: const Text('Current Year'), value: "tax_cur"),
          ],
        ),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    sections = Provider.of<ArchitectureFormulairePagesManagerProvider>(context);
    return Column(
      children: [
        Gap(20.h),
        Row(
          children: [
            IconButton(icon: Icon(FluentIcons.navigate_back,color: AppColors.rouge,size: 40.h,), onPressed: () {
              sections.setPage(0);
            }),
            Gap(40.w),
            Text("Formulaire de Sondage",style: AppTextStyle.buttonStyleTexte.copyWith(color: AppColors.primary,fontSize: 20.sp+10,),)
          ],
        ),
        Gap(20.h),
        Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Bloc2(
                    title: "À Propos" ,
                    child: Column(
                      children: [
                        TextForm(title: "Nom du formulaire",onChanged: (value){}, onFieldSubmitted: (value){}),
                        BigTextForm(title: "Description",onFieldSubmitted: (value){},),
                        RadioMenuForm(title: "Inclusion dans les dossiers",list: ["Facultatif", "Par défaut"], onChanged: (value){}, onFieldSubmitted: (value){}),
                      ],
                    ),
                  ),
                  Bloc2(
                    title: "Lossature" ,
                    child: TreeView(
                      selectionMode: TreeViewSelectionMode.none,
                      shrinkWrap: true,
                      items: items,
                      onSelectionChanged: (selectedItems) async => debugPrint(
                          'onSelectionChanged: \${selectedItems.map((i) => i.value)}'),
                      onSecondaryTap: (item, details) async {
                        debugPrint('onSecondaryTap $item at ${details.globalPosition}');
                      },
                    ),
                  ),
                ],
              ),
            ),),
      ],
    );
  }
}

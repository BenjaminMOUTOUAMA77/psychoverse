import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc11.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';

class FormulaireArchitecture extends StatefulWidget {
  const FormulaireArchitecture({Key? key}) : super(key: key);

  @override
  State<FormulaireArchitecture> createState() => _FormulaireArchitectureState();
}

class _FormulaireArchitectureState extends State<FormulaireArchitecture> {

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
    return
      Bloc11(
        icon: FluentIcons.form_library,
        title: "Formulaire",
        number: 10,
        child: Bloc2(
          title: "Lossature du formulaire",
          child: TreeView(
            selectionMode: TreeViewSelectionMode.multiple,
            shrinkWrap: true,
            items: items,
            onSelectionChanged: (selectedItems) async => debugPrint(
                'onSelectionChanged: \${selectedItems.map((i) => i.value)}'),
            onSecondaryTap: (item, details) async {
              debugPrint('onSecondaryTap $item at ${details.globalPosition}');
            },
          ),
        ),
      );
  }
}

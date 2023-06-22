import 'package:fluent_ui/fluent_ui.dart';


class SuivisTab extends StatefulWidget {
  int currentIndex;
  List<Tab> tabs;
  SuivisTab({Key? key,this.currentIndex=0,this.tabs=const[]}) : super(key: key);

  @override
  State<SuivisTab> createState() => _SuivisTabState();
}

class _SuivisTabState extends State<SuivisTab> {
  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}

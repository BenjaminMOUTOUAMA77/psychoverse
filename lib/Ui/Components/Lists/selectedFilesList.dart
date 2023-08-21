import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:open_file/open_file.dart';
import 'package:psychoverse/Ui/Components/Lists/zListGenerator.dart';
import 'package:psychoverse/Ui/Components/Tiles/fileTile.dart';

class SelectedFilesList extends StatefulWidget {
  List<PlatformFile> files;
  Function(List<PlatformFile>)? onChanged;
  SelectedFilesList({Key? key, required this.files,this.onChanged})
      : super(key: key);

  @override
  State<SelectedFilesList> createState() => _SelectedFilesListState();
}

class _SelectedFilesListState extends State<SelectedFilesList> {
  @override
  Widget build(BuildContext context) {
    List<String> getFilesNames(){
      List<String> list=[];
      for(var item in widget.files){
        list.add(item.name);
      }
      return list;
    }
    return ListGenerator(
      list: getFilesNames(),
      useParticularOntap: true,
      onTap: (index){
        OpenFile.open(widget.files[index].path);
      },
      useParticularWidget: true,
      getWidget: (index){
        return FileTile(file: widget.files[index],cancelFunction:(){
          setState(() {
            widget.files.removeAt(index);
            widget.onChanged!(widget.files);
            if(widget.files.isEmpty) {
              Navigator.pop(context);
            }
          });
        },);
      },
    );
  }
}

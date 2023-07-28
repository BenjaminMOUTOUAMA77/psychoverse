import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/PopUps/pickFilePopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/smallPopUp.dart';

Future<void> pickFile(BuildContext context,{bool image=false,bool document=false,bool media=false,}) async {

  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    lockParentWindow: true,
    allowedExtensions: ['jpg','jpeg','png','tif','tiff','raw',],
  );
  if (result != null) {
    List<PlatformFile> files = result.files;
    for(PlatformFile file in files){
      showDialog(context: context, builder: (context)=>SmallPopUp(title: "Choisir un fichier",child: PickFilePopUp(file: file,),));
    }
  } else {
    // User canceled the picker
  }
}

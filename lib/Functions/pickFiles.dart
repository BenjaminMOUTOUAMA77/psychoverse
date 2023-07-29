import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Functions/appPaths.dart';
import 'package:psychoverse/Ui/Components/PopUps/pickFilePopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/smallPopUp.dart';

Future<void> pickFile(BuildContext context,{bool image=false,bool custum=false,List<String> extens=const [],bool media=false,bool multiple=false}) async {

  FileType fileType=FileType.any;
  List<String> extensions=["mp3","jpeg","png","tif","tiff","raw","pdf","doc",];
  if(image){
    fileType=FileType.image;
    extensions = ["jpg","jpeg","png","tif","tiff","raw",];
  }else if(media){
    fileType=FileType.media;
    extensions = ["mp3","jpeg","png","tif","tiff",];
  }else if(custum){
    fileType=FileType.custom;
    extensions = extens;
  }else(document){
    fileType=FileType.any;
  };

  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    allowMultiple: multiple,
    lockParentWindow: true,
    allowedExtensions: extensions,
  );

  if (result != null) {
    List<PlatformFile> files = result.files;
    showDialog(context: context, builder: (context)=>SmallPopUp(title: "Choisir un fichier",child: PickFilePopUp(files: files,),));
  } else {
    // User canceled the picker
  }
}

Future<File> saveFile(PlatformFile oldFile) async {
  final String path = await getAppPath(appFilesDirectory: true);
  final newFile = File("${path}${Random().nextInt(99999)}_${oldFile.name}");
  return File(oldFile.path!).copy(newFile.path);
}

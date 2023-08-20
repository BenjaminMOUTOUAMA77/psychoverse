import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Functions/appPaths.dart';
import 'package:psychoverse/Functions/extensions.dart';
import 'package:psychoverse/Ui/Components/Lists/selectedFilesList.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';

import '../Ui/Components/PopUps/zMiddlePopUp.dart';

Future<void> pickFiles(
  BuildContext context, {
  String dialogueTitle = "Choisir un ou plusieurs fichier",
  bool image = false,
  bool pdf = false,
  bool word = false,
  bool exel = false,
  bool powerpoint = false,
  bool text = false,
  bool document = false,
  bool video = false,
  bool audio = false,
  bool multiple = false,
  Function(List<PlatformFile>)? onPiked,
}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    dialogTitle: dialogueTitle,
    type: getFilesType(
        image: image,
        pdf: pdf,
        word: word,
        exel: exel,
        powerpoint: powerpoint,
        text: text,
        document: document,
        video: video,
        audio: audio),
    allowMultiple: multiple,
    lockParentWindow: true,
    allowedExtensions: getExtensions(
        image: image,
        pdf: pdf,
        word: word,
        exel: exel,
        powerpoint: powerpoint,
        text: text,
        document: document,
        video: video,
        audio: audio),
  );

  if (result != null) {
    List<PlatformFile> files = result.files;
    showDialog(
      context: context,
      builder: (context) => files.length<=3? SmallPopUp(
        title: "Fichier(s) sélectionné(s)",
        save: true,
        saveTexte: "Enrégistrer",
        saveFunction: () {
          onPiked != null? files.isEmpty?null: onPiked(files):null;
          Navigator.pop(context);
        },
        cancelTexte: "Annuler",
        child: SingleChildScrollView(
          child: SelectedFilesList(
            files: files,
            onChanged: (value) {
              files = value;
            },
          ),
        ),
      ):MiddlePopUp(
        title: "Fichier(s) sélectionné(s)",
        save: true,
        saveTexte: "Enrégistrer",
        saveFunction: () {
          onPiked != null? files.isEmpty?null: onPiked(files):null;
          Navigator.pop(context);
        },
        cancelTexte: "Annuler",
        child: SingleChildScrollView(
          child: SelectedFilesList(
            files: files,
            onChanged: (value) {
              files = value;
            },
          ),
        ),
      ),
    );
  } else {
    // User canceled the picker
  }
}

Future<PlatformFile> saveFile(PlatformFile oldFile) async {
  List<String> decomposeName = oldFile.name.split(".");
  String oldName = decomposeName.first;
  String newName = "${oldName}_${Random().nextInt(99999)}_pcv";
  String newFullName = "$newName.${oldFile.extension}";
  int size = oldFile.size;

  final String appFilesPath = await getAppPath(appFilesDirectory: true);

  final newFilePath = "$appFilesPath$newFullName";
  File newFile = await File(oldFile.path!).copy(newFilePath);
  return PlatformFile(
    name: newFullName,
    size: size,
    path: newFile.path,
  );
}

Future<FileSystemEntity> deleteFile(PlatformFile file) async {
  return File(file.path!).delete(recursive: true);
}

String extensionFromPath(String path){
  List<String> decomposeName = path.split(".");
  return decomposeName[1];
}
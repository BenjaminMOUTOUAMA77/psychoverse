import 'dart:io';
import 'package:path_provider/path_provider.dart';

createAppFolders() async {
  late Directory appDirectory;
  late Directory appFilesDirectory;

  //Creating Files Directory
  appDirectory = await getApplicationSupportDirectory();
  appFilesDirectory = Directory("${appDirectory.path}\\Files\\");
  if (await appFilesDirectory.exists()) {
  } else {
    await appFilesDirectory.create(recursive: true);
  }
}

Future<String> getAppPath({bool appFilesDirectory=false}) async {
  //Creating Files Directory
  Directory myAppDirectory = await getApplicationSupportDirectory();
  String path = myAppDirectory.path;
  if(appFilesDirectory){
    path+="\\Files\\";
  }
  return path;
}
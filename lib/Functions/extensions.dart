import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';

IconData getFileIcon(String extension) {
  if (isImage(extension)) {
    return FluentIcons.file_image;
  } else if (isPdf(extension)) {
    return FluentIcons.pdf;
  } else if (isWord(extension)) {
    return FluentIcons.docs_logo_inverse;
  } else if (isExel(extension)) {
    return FluentIcons.excel_document;
  } else if (isPowerpoint(extension)) {
    return FluentIcons.power_point_document;
  } else if (isText(extension)) {
    return FluentIcons.text_document;
  } else if (isDocument(extension)) {
    return FluentIcons.document;
  } else if (isVideo(extension)) {
    return FluentIcons.m_s_n_videos_solid;
  } else if (isAudio(extension)) {
    return FluentIcons.music_in_collection_fill;
  } else {
    return FluentIcons.file_template;
  }
}

FileType getFilesType({
  bool image = false,
  bool pdf = false,
  bool word = false,
  bool exel = false,
  bool powerpoint = false,
  bool text = false,
  bool document = false,
  bool video = false,
  bool audio = false,
}) {
  if (image) {
    return FileType.image;
  } else if (pdf) {
    return FileType.custom;
  } else if (word) {
    return FileType.custom;
  } else if (exel) {
    return FileType.custom;
  } else if (powerpoint) {
    return FileType.custom;
  } else if (text) {
    return FileType.custom;
  } else if (document) {
    return FileType.custom;
  } else if (video) {
    return FileType.video;
  } else if (audio) {
    return FileType.audio;
  } else {
    return FileType.any;
  }
}

bool isImage(String extension) {
  if (getExtensions(image: true).contains(extension)) {
    return true;
  } else {
    return false;
  }
}

bool isPdf(String extension) {
  if (getExtensions(pdf: true).contains(extension)) {
    return true;
  } else {
    return false;
  }
}

bool isWord(String extension) {
  if (getExtensions(word: true).contains(extension)) {
    return true;
  } else {
    return false;
  }
}

bool isExel(String extension) {
  if (getExtensions(exel: true).contains(extension)) {
    return true;
  } else {
    return false;
  }
}

bool isPowerpoint(String extension) {
  if (getExtensions(powerpoint: true).contains(extension)) {
    return true;
  } else {
    return false;
  }
}

bool isText(String extension) {
  if (getExtensions(text: true).contains(extension)) {
    return true;
  } else {
    return false;
  }
}

bool isDocument(String extension) {
  if (getExtensions(document: true).contains(extension)) {
    return true;
  } else {
    return false;
  }
}

bool isVideo(String extension) {
  if (getExtensions(video: true).contains(extension)) {
    return true;
  } else {
    return false;
  }
}

bool isAudio(String extension) {
  if (getExtensions(audio: true).contains(extension)) {
    return true;
  } else {
    return false;
  }
}

List<String> getExtensions({
  bool image = false,
  bool pdf = false,
  bool word = false,
  bool exel = false,
  bool powerpoint = false,
  bool text = false,
  bool document = false,
  bool video = false,
  bool audio = false,
}) {
  if (image) {
    return [
      "jpg",
      "jpeg",
      "jpe",
      "jif",
      "jfif",
      "jfi",
      "png",
      "gif",
      "webp",
      "tif",
      "tiff",
      "raw",
      "arw",
      "cr2",
      "nrw",
      "k25",
      "bmp",
      "dib",
      "heif",
      "heic",
      "ind",
      "indd",
      "indt",
      "jp2",
      "j2k",
      "jpf",
      "jpx",
      "jpm",
      "mj2",
    ];
  } else if (pdf) {
    return ["pdf"];
  } else if (word) {
    return ["doc", "docx"];
  } else if (exel) {
    return ["xls", "xlsx"];
  } else if (powerpoint) {
    return ["ppt", "pptx"];
  } else if (text) {
    return ["txt"];
  } else if (document) {
    return [
      "ods",
      "odt",
      "djvu",
      "docbook",
      "html",
      "htm",
      "fb2",
      "md",
      "odt",
      "sxw",
      "ps",
      "rtf",
      "tex",
      "svg",
      "wpd",
      "wp",
      "wp7",
    ];
  } else if (video) {
    return [
      "webm",
      "mkv",
      "flv",
      "vob",
      "ogv",
      "ogg",
      "drc",
      "gif",
      "gifv",
      "mng",
      "avi",
      "mts",
      "m2ts",
      "ts",
      "mov",
      "qt",
      "wmv",
      "yuv",
      "rm",
      "rmvb",
      "viv",
      "asf",
      "amv",
      "mp4",
      "m4p",
      "m4v",
      "mpg",
      "mp2",
      "mpeg",
      "mpe",
      "mpv",
      "mpg",
      "mpeg",
      "m2v",
      "m4v",
      "svi",
      "3gp",
      "3g2",
      "mxf",
      "roq",
      "nsv",
      "flv",
      "f4v",
      "f4p",
      "f4a",
      "f4b",
    ];
  } else if (audio) {
    return [
      "3gp",
      "aa",
      "aac",
      "aax",
      "act",
      "aiff",
      "alac",
      "amr",
      "ape",
      "au",
      "awb",
      "dss",
      "dvf",
      "flac",
      "gsm",
      "iklax",
      "ivs",
      "m4a",
      "m4b",
      "m4b",
      "mmf",
      "movpkg",
      "mp3",
      "mpc",
      "msv",
      "nmf",
      "ogg",
      "oga",
      "mogg",
      "opus",
      "ra",
      "rm",
      "raw",
      "rf64",
      "sln",
      "tta",
      "voc",
      "vox",
      "wav",
      "wma",
      "wv",
      "webm",
      "8svx",
      "cda",
    ];
  } else {
    return [
      "jpg",
      "jpeg",
      "jpe",
      "jif",
      "jfif",
      "jfi",
      "png",
      "gif",
      "webp",
      "tif",
      "tiff",
      "raw",
      "arw",
      "cr2",
      "nrw",
      "k25",
      "bmp",
      "dib",
      "heif",
      "heic",
      "ind",
      "indd",
      "indt",
      "jp2",
      "j2k",
      "jpf",
      "jpx",
      "jpm",
      "mj2",
      "pdf",
      "doc",
      "docx",
      "xls",
      "xlsx",
      "ppt",
      "pptx",
      "txt",
      "ods",
      "odt",
      "djvu",
      "docbook",
      "html",
      "htm",
      "fb2",
      "md",
      "odt",
      "sxw",
      "ps",
      "rtf",
      "tex",
      "svg",
      "wpd",
      "wp",
      "wp7",
      "webm",
      "mkv",
      "flv",
      "vob",
      "ogv",
      "ogg",
      "drc",
      "gif",
      "gifv",
      "mng",
      "avi",
      "mts",
      "m2ts",
      "ts",
      "mov",
      "qt",
      "wmv",
      "yuv",
      "rm",
      "rmvb",
      "viv",
      "asf",
      "amv",
      "mp4",
      "m4p",
      "m4v",
      "mpg",
      "mp2",
      "mpeg",
      "mpe",
      "mpv",
      "mpg",
      "mpeg",
      "m2v",
      "m4v",
      "svi",
      "3gp",
      "3g2",
      "mxf",
      "roq",
      "nsv",
      "flv",
      "f4v",
      "f4p",
      "f4a",
      "f4b",
      "3gp",
      "aa",
      "aac",
      "aax",
      "act",
      "aiff",
      "alac",
      "amr",
      "ape",
      "au",
      "awb",
      "dss",
      "dvf",
      "flac",
      "gsm",
      "iklax",
      "ivs",
      "m4a",
      "m4b",
      "m4b",
      "mmf",
      "movpkg",
      "mp3",
      "mpc",
      "msv",
      "nmf",
      "ogg",
      "oga",
      "mogg",
      "opus",
      "ra",
      "rm",
      "raw",
      "rf64",
      "sln",
      "tta",
      "voc",
      "vox",
      "wav",
      "wma",
      "wv",
      "webm",
      "8svx",
      "cda",
    ];
  }
}

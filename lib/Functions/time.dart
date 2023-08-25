import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';

String dateFormat(BuildContext context, DateTime date) =>
    DateFormat.yMMMMEEEEd(Localizations.localeOf(context).languageCode)
        .format(date);
String getDay(day){
  if(day==0){
    return "Lundi";
  }else if(day==1){
    return "Mardi";
  }else if(day==2){
    return "Mercredi";
  }else if(day==3){
    return "Jeudi";
  }else if(day==4){
    return "Vendredi";
  }else if(day==5){
    return "Samedi";
  }else {
    return "Dimanche";
  }
}

DateTime now() => DateTime.now();

DateTime firstDate()=>DateTime(now().year-10);
DateTime lastDate()=>DateTime(now().year+10);
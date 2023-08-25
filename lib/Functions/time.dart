import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';

String dateFormat(BuildContext context, DateTime date) =>
    DateFormat.yMMMMEEEEd(Localizations.localeOf(context).languageCode)
        .format(date);
String timeFormat(BuildContext context,DateTime time) =>
    DateFormat.jm(Localizations.localeOf(context).languageCode).format(time)
;

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

bool isToday(DateTime date)=>DateTime(now().year,now().month,now().day) == DateTime(date.year,date.month,date.day);

bool isSelectedDay(DateTime date1,DateTime date2)=>DateTime(date2.year,date2.month,date2.day) == DateTime(date1.year,date1.month,date1.day);

bool isSelectedMonth(DateTime date1,DateTime date2)=>DateTime(date2.year,date2.month) == DateTime(date1.year,date1.month);
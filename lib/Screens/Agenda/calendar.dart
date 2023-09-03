import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Functions/time.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/Ui/Components/Lists/zListGenerator.dart';
import 'package:psychoverse/Ui/Components/PopUps/zMiddlePopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/patientTile.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Calendar extends StatefulWidget {
  EventController eventController;
  Calendar({Key? key, required this.eventController}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final monthViewKey = GlobalKey<MonthViewState>();

  MonthViewState monthView() => monthViewKey.currentState!;

  late ChangeSectionsProvider sections;

  DateTime selectedDay = now();
  @override
  Widget build(BuildContext context) {

    sections = Provider.of<ChangeSectionsProvider>(context);
    MainScreenPagesManagerProvider pagesManager = Provider.of<MainScreenPagesManagerProvider>(context);

    return Scaffold(
      body: MonthView(
        key: monthViewKey,
        controller: widget.eventController,
        minMonth: DateTime(now().year - 10),
        maxMonth: DateTime(now().year + 10),
        borderSize: 0.2,
        cellAspectRatio: 1.7,
        headerBuilder: (time) {
          return Container(
            height: 90.h,
            color: AppColors.primary,
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          monthView().previousPage();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.blanc,
                          size: 40.h,
                        ),
                      ),
                      Gap(20.w),
                      IconButton(
                        onPressed: () {
                          monthView().nextPage();
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.blanc,
                          size: 40.h,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    dateFormat(context, selectedDay),
                    style: AppTextStyle.buttonStyleTexte.copyWith(
                        fontSize: 15.sp + 10, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Tooltip(
                        message: "Mois actuelle",
                        child: IconButton(
                          onPressed: () {
                            monthView().animateToMonth(now());
                            setState(() {
                              selectedDay = now();
                            });
                          },
                          icon: Icon(
                            Icons.event_repeat,
                            color: AppColors.blanc,
                            size: 40.h,
                          ),
                        ),
                      ),
                      Gap(20.w),
                      Tooltip(
                        message: "Date spécifique",
                        child: IconButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: now(),
                              firstDate: firstDate(),
                              lastDate: lastDate(),
                            ).then((value) {
                              monthView().animateToMonth(value!);
                              selectedDay = value;
                            });
                          },
                          icon: Icon(
                            Icons.edit_calendar,
                            color: AppColors.blanc,
                            size: 40.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        weekDayBuilder: (day) {
          return Container(
            height: 70.h,
            color: AppColors.blancGrise,
            alignment: Alignment.center,
            child: Text(
              getDay(day),
              style: AppTextStyle.filedTexte,
            ),
          );
        },
        cellBuilder: (date, events, bool1, bool2) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.blanc,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Opacity(
              opacity: isSelectedMonth(date, selectedDay) ? 1 : 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_right,size: 60.w,color: isToday(date) ? AppColors.secondary : isSelectedDay(date, selectedDay) ? AppColors.primary : Colors.transparent,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date.day.toString(),
                        style: AppTextStyle.filedTexte.copyWith(
                          fontSize: 15.sp + 5,
                          color: AppColors.primary,
                        ),
                      ),
                      Gap(10.w),
                      events.isNotEmpty? Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: isToday(date) ? AppColors.secondary : AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          events.length.toString(),
                          style: AppTextStyle.filedTexte.copyWith(
                              color: AppColors.blanc, fontSize: 10.sp + 5),
                        ),
                      ):const Gap(0),
                    ],
                  ),
                  Icon(Icons.arrow_left,size: 60.w,color: isToday(date) ? AppColors.secondary : isSelectedDay(date, selectedDay) ? AppColors.primary : Colors.transparent,),
                ],
              ),
            ),
          );
        },
        onCellTap: (events, date) {

          List<String> patientList=[];

          for(var item in events){
            patientList.add(item.title);
          }
          setState(() {
            selectedDay = date;
            monthView().animateToMonth(selectedDay);
            events.isNotEmpty? showDialog(
              context: context,
              builder: (context) => MiddlePopUp(
                child: SingleChildScrollView(
                  child: ListGenerator(
                    list: patientList,
                    useParticularWidget: true,
                    useParticularOntap: true,
                    getWidget: (index){
                      return PatientTile(nom: patientList[index],time1: now(),time2: now(),);
                    },
                    onTap: (index){
                      Navigator.pop(context);
                      pagesManager.setPage(1);
                    },

                  ),
                ),
              ),
            ):Null;
          });
        },
      ),
    );
  }
}

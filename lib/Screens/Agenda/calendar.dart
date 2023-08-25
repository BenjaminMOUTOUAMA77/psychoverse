import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Functions/time.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
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

  @override
  Widget build(BuildContext context) {
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
                    dateFormat(context, time),
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
          return Padding(
            padding: EdgeInsets.all(15.h),
            child: Badge(
              textColor: AppColors.rouge,
              backgroundColor: AppColors.blancGrise,
              smallSize: 50,
              largeSize: 50,
              padding: EdgeInsets.all(10.h),
              alignment: Alignment.center,
              label: Text("45"),
              child: Text(
                date.day.toString(),
                style: AppTextStyle.filedTexte.copyWith(
                  fontSize: 12.sp + 10,
                  color: DateTime(date.year, date.month, date.day) ==
                      DateTime(now().year, now().month, now().day) || events.isNotEmpty
                      ? AppColors.blanc
                      : AppColors.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

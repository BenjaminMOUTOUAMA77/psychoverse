import 'package:calendar_view/calendar_view.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:psychoverse/Screens/Agenda/calendar.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  EventController controller = EventController(

  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MakeBackgroundImage(),
        CalendarControllerProvider(
          controller: controller,
          child: Calendar(eventController: controller,),
        ),
      ],
    );
  }
}

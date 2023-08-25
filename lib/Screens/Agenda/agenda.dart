import 'package:calendar_view/calendar_view.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:psychoverse/Functions/time.dart';
import 'package:psychoverse/Screens/Agenda/calendar.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  List<CalendarEventData> _events = [
    CalendarEventData(
      title: "Prise de contact",
      date: DateTime(now().year,now().month,now().day-5),
      description: "Description",
    ),
    CalendarEventData(
      title: "Liste des attaches sur Compact",
      date: DateTime(now().year,now().month,now().day+6),
      description: "Description",
    ),
    CalendarEventData(
      title: "Expérience Vr1",
      date: DateTime(now().year,now().month,now().day+2),
      description: "Description",
    ),
    CalendarEventData(
      title: "Description de la structure de capteur",
      date: DateTime(now().year,now().month,now().day+1),
      description: "Description",
    ),
    CalendarEventData(
      title: "Lavril de VEn",
      date: DateTime(now().year,now().month,now().day),
      description: "Description",
    ),
    CalendarEventData(
      title: "Cadre de conception de netoyeur ananatomique",
      date: DateTime(now().year,now().month,now().day-8),
      description: "Description",
    ),
    CalendarEventData(
      title: "Nitrate de déssoudure de ferme",
      date: DateTime(now().year,now().month,now().day-10),
      description: "Description",
    ),
    CalendarEventData(
      title: "Forme de notrique assidu",
      date: DateTime(now().year,now().month,now().day+7),
      description: "Description",
    ),
    CalendarEventData(
      title: "Wideo de sauf dans la cataude",
      date: DateTime(now().year,now().month,now().day+4),
      description: "Description",
    ),
    CalendarEventData(
      title: "Noeud de capner",
      date: DateTime(now().year,now().month,now().day+5),
      description: "Description",
    ),
    CalendarEventData(
      title: "No Time de Wen",
      date: DateTime(now().year,now().month,now().day-4),
      description: "Description",
    ),
    CalendarEventData(
      title: "La route étroite de noud",
      date: DateTime(now().year,now().month,now().day-1),
      description: "Description",
    ),
  ];
  EventController controller = EventController();

  @override
  Widget build(BuildContext context) {
    controller.addAll(_events);
    return Stack(
      children: [
        const MakeBackgroundImage(),
        CalendarControllerProvider(
          controller: controller,
          child: Calendar(
            eventController: controller,
          ),
        ),
      ],
    );
  }
}

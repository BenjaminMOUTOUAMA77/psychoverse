import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/dateForm.dart';
import 'package:psychoverse/Ui/Components/Forms/timeForm.dart';

class Seance extends StatefulWidget {
  int numero;
  DateTime? dateActuelle;
  DateTime? dateProchaine;
  DateTime? heureActuelle;
  DateTime? heureProchaine;
  String noteActuelle;
  String noteProchaine;
  Seance(
      {Key? key,
      this.numero = 0,
      this.dateActuelle,
      this.dateProchaine,
      this.heureActuelle,
      this.heureProchaine,
      this.noteActuelle = "",
      this.noteProchaine = ""})
      : super(key: key);

  @override
  State<Seance> createState() => _SeanceState();
}

class _SeanceState extends State<Seance> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdaptiveLayout(
          mediumLayout: Row(
            children: [
              Expanded(
                child: AppDateForm(
                    title: "Date",
                    value: widget.dateActuelle,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
              Gap(20.w),
              Expanded(
                child: TimeForm(
                    title: "Heure de début",
                    value: widget.heureActuelle,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
              Gap(20.w),
              Expanded(
                child: TimeForm(
                    title: "Heure de fin",
                    value: widget.heureActuelle,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
            ],
          ),
          smallLayout: Column(
            children: [
              AppDateForm(
                  title: "Date",
                  value: widget.dateActuelle,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
              TimeForm(
                  title: "Heure",
                  value: widget.heureActuelle,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
              TimeForm(
                  title: "Heure de fin",
                  value: widget.heureActuelle,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
            ],
          ),
        ),
        BigTextForm(title: "Note", onFieldSubmitted: (value) {}),
        AdaptiveLayout(
          mediumLayout: Row(
            children: [
              Expanded(
                child: AppDateForm(
                    title: "Date",
                    value: widget.dateActuelle,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
              Gap(20.w),
              Expanded(
                child: TimeForm(
                    title: "Heure de début",
                    value: widget.heureActuelle,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
              Gap(20.w),
              Expanded(
                child: TimeForm(
                    title: "Heure de fin",
                    value: widget.heureActuelle,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
            ],
          ),
          smallLayout: Column(
            children: [
              AppDateForm(
                  title: "Date",
                  value: widget.dateActuelle,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
              TimeForm(
                  title: "Heure",
                  value: widget.heureActuelle,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
              TimeForm(
                  title: "Heure de fin",
                  value: widget.heureActuelle,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
            ],
          ),
        ),
        BigTextForm(title: "Programme", onFieldSubmitted: (value) {}),
      ],
    );
  }
}

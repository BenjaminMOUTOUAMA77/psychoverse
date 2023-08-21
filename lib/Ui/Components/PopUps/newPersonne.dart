import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/Forms/phoneForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';

class newPersonne extends StatefulWidget {
  Function({
    String? nom,
    String? phoneNumber,
    String? callingCode,
    String? contryCode,
    String? email,
  })? onChanged;
  newPersonne({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  State<newPersonne> createState() => _newPersonneState();
}

class _newPersonneState extends State<newPersonne> {
  // Properties
  String? nom;
  String? phoneNumber;
  String? countryCode;
  String? callingCode;
  String? email;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          TextForm(
            title: "Nom prénoms",
            value: nom,
            onChanged: (value) {},
            onFieldSubmitted: (value) {
              nom = value;
              widget.onChanged!(
                nom: nom,
                phoneNumber: phoneNumber,
                contryCode: countryCode,
                email: email,
              );
            },
          ),
          PhoneForm(
              title: "Téléphone",
              phoneNumber: phoneNumber,
              countryCode: countryCode,
              callingCode: callingCode,
              onFieldSubmitted: ({phoneNumber,countryCode,callingCode}) {
                this.phoneNumber = phoneNumber;
                this.countryCode=countryCode;
                this.callingCode=callingCode;
                widget.onChanged!(
                  nom: nom,
                  phoneNumber: this.phoneNumber,
                  contryCode: this.countryCode,
                  callingCode: this.callingCode,
                  email: email,
                );
              },
          ),
          TextForm(
              title: "Email",
              email: true,
              value: email,
              onFieldSubmitted: (value) {
                email = value;
                widget.onChanged!(
                  nom: nom,
                  phoneNumber: phoneNumber,
                  contryCode: countryCode,
                  email: email,
                );
              },
          ),
        ],
      ),
    );
  }
}

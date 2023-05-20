import 'package:country_calling_code_picker/picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/formBox.dart';
import 'package:psychoverse/Ui/Components/appProgressRing.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class PhoneForm extends StatefulWidget {
  final String title;
  String placehholder;
  String country;
  String? value;
  bool readOnly;
  bool managers;
  TextEditingController controller = TextEditingController();
  Function({String numero, String country}) onChanged;
  Function({String numero, String country}) onFieldSubmitted;

  PhoneForm({
    Key? key,
    this.title = "Phone Form",
    this.readOnly=true,
    this.managers=true,
    this.country = "BJ",
    this.value,
    this.placehholder = "...",
    required this.onChanged,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  Country? _selectedCountry;

  @override
  void initState() {
    initCountry();
    super.initState();
  }

  void initCountry() async {
    Country? country = await getCountryByCountryCode(context, widget.country);
    setState(() {
      _selectedCountry = country;
    });
  }

  void _showCountryPicker() async {
    final country = await showCountryPickerDialog(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppFormBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: AppTextStyle.formLabelStyleTexte,
              ),
              widget.managers?Row(
                children: [
                  widget.readOnly
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: IconButton(
                            icon: Icon(
                              FluentIcons.edit,
                              color: AppColors.primary,
                              size: 20.h,
                            ),
                            onPressed: () {
                              setState(() {
                                widget.readOnly = false;
                              });
                            },
                          ),
                        )
                      : Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: IconButton(
                                icon: Icon(
                                  FluentIcons.sync_occurence_cancel,
                                  color: AppColors.primary,
                                  size: 20.h,
                                ),
                                onPressed: () {
                                  setState(() {
                                    initCountry();
                                    widget.value == null
                                        ? widget.controller.clear()
                                        : widget.controller.value =
                                            TextEditingValue(
                                                text: widget.value.toString());
                                    widget.readOnly = true;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: IconButton(
                                icon: Icon(
                                  FluentIcons.save_template,
                                  color: AppColors.primary,
                                  size: 20.h,
                                ),
                                onPressed: () {
                                  if (_selectedCountry != null) {
                                    widget.country = _selectedCountry!
                                        .countryCode
                                        .toString();
                                  }
                                  widget.value = widget.controller.text;
                                  widget.onFieldSubmitted(
                                      numero: widget.value.toString(),
                                      country: widget.country);

                                  setState(() {
                                    widget.readOnly = true;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                ],
              ):const Gap(0),
            ],
          ),
          TextFormBox(
            controller: widget.controller,
            keyboardType: TextInputType.phone,
            style: AppTextStyle.formStyleTexte,
            readOnly: widget.readOnly,
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
            onChanged: (value) =>
                widget.onChanged(numero: value, country: widget.country),
            onFieldSubmitted: (value) {
              widget.value = value;
              widget.onFieldSubmitted(numero: value, country: widget.country);
              setState(() {
                widget.readOnly = true;
              });
            },
            validator: (value) {},
            cursorColor: AppColors.rouge,
            placeholder: widget.placehholder,
            placeholderStyle: AppTextStyle.formPlaceHolderStyleTexte,
            unfocusedColor: Colors.transparent,
            decoration: BoxDecoration(
              border: Border.all(
                style: BorderStyle.none,
              ),
            ),
            highlightColor: Colors.transparent,
            prefix: Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Icon(
                      FluentIcons.cell_phone,
                      size: 25.h,
                      color: AppColors.rouge,
                    ),
                  ),
                  _selectedCountry?.flag==null? AppProgressRing():GestureDetector(
                    onTap: () => widget.readOnly ? null : _showCountryPicker(),
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Row(
                        children: [
                          Container(
                            width: 70.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: AppDesignEffects.BorderAll0,
                              boxShadow: [
                                AppDesignEffects.shadow2,
                              ],
                            ),
                            child:Image.asset(
                              _selectedCountry!.flag,
                              package: countryCodePackageName,
                              fit: BoxFit.cover,
                            ),
                            clipBehavior: Clip.hardEdge,
                          ),
                          Text(
                            '${_selectedCountry!.callingCode} ${_selectedCountry!.name} (${_selectedCountry!.countryCode})',
                            style: AppTextStyle.filedTexte
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

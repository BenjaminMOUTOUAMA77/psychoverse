import 'package:country_calling_code_picker/picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/zFormBox.dart';
import 'package:psychoverse/Ui/Components/AllOthers/appProgressRing.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class PhoneForm extends StatefulWidget {
  final String title;
  String placehholder;
  String? countryCode;
  String? phoneNumber;
  String? callingCode;
  bool readOnly;
  bool managers;
  TextEditingController controller = TextEditingController();
  Function({String? phoneNumber, String? callingCode, String? countryCode})?
      onFieldSubmitted;

  PhoneForm({
    Key? key,
    this.title = "Phone Form",
    this.readOnly = true,
    this.managers = true,
    this.countryCode,
    this.phoneNumber,
    this.callingCode,
    this.placehholder = "_",
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  Country? _selectedCountry;
  String? phoneNumber;
  String? countryCode;
  String? callingCode;

  @override
  void initState() {
    phoneNumber = widget.phoneNumber;
    countryCode = widget.countryCode;
    callingCode = widget.callingCode;
    initCountry();
    super.initState();
  }

  void initCountry() async {
    countryCode ??= "BJ";
    Country? country = await getCountryByCountryCode(context, countryCode!);
    setState(() {
      _selectedCountry = country;
    });

    widget.phoneNumber == null
        ? widget.controller.clear()
        : widget.controller.value = TextEditingValue(
            text: widget.phoneNumber.toString(),
          );
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
              widget.managers
                  ? Row(
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: IconButton(
                                      icon: Icon(
                                        FluentIcons.sync_occurence_cancel,
                                        color: AppColors.primary,
                                        size: 20.h,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.readOnly = true;
                                        });
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: IconButton(
                                      icon: Icon(
                                        FluentIcons.save_template,
                                        color: AppColors.primary,
                                        size: 20.h,
                                      ),
                                      onPressed: () {
                                        if (_selectedCountry != null) {
                                          widget.countryCode =
                                              _selectedCountry!.countryCode;
                                          widget.callingCode =
                                              _selectedCountry!.callingCode;
                                        }
                                        widget.phoneNumber =
                                            widget.controller.text;
                                        widget.onFieldSubmitted!(
                                            phoneNumber: widget.phoneNumber,
                                            callingCode: widget.callingCode,
                                            countryCode: widget.countryCode);
                                        setState(() {
                                          widget.readOnly = true;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    )
                  : const Gap(0),
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
            onFieldSubmitted: (value) {
              phoneNumber = value;
              countryCode=_selectedCountry!.countryCode;
              callingCode=_selectedCountry!.callingCode;
              widget.onFieldSubmitted!(
                phoneNumber: phoneNumber,
                callingCode: callingCode,
                countryCode: countryCode,
              );
              setState(() {
                widget.readOnly = true;
              });
            },
            validator: (value) {},
            cursorColor: AppColors.bleu,
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
                      color: AppColors.bleu,
                    ),
                  ),
                  _selectedCountry?.flag == null
                      ? AppProgressRing()
                      : GestureDetector(
                          onTap: () =>
                              widget.readOnly ? null : _showCountryPicker(),
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
                                  child: Image.asset(
                                    _selectedCountry!.flag,
                                    package: countryCodePackageName,
                                    fit: BoxFit.cover,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                ),
                                Text(
                                  '${_selectedCountry!.callingCode} ${_selectedCountry!.name} (${_selectedCountry!.countryCode})',
                                  style: AppTextStyle.smallTexte
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

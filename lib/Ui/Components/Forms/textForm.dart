import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/zFormBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class TextForm extends StatefulWidget {
  bool email;
  bool addresse;
  bool password;

  bool showPassword=true;

  String title;
  String placehholder;
  String? value;
  bool readOnly;
  bool managers;
  TextEditingController controller = TextEditingController();
  Function(String?)? onChanged;
  Function(String?)? onFieldSubmitted;
  TextForm({
    Key? key,
    this.email=false,
    this.addresse=false,
    this.password=false,

    this.title = "TextFormBox",
    this.value,
    this.readOnly=true,
    this.managers=true,
    this.placehholder = "_",
    this.onChanged,
    this.onFieldSubmitted,
  }) : super(key: key);



  TextInputType getKeyboardType(){
    if(email){
      return TextInputType.emailAddress;
    }else if(addresse){
      return TextInputType.streetAddress;
    }else if(password){
      return TextInputType.visiblePassword;
    }else{
      return TextInputType.text;
    }
  }
  IconData getIcon(){
    if(email){
      return FluentIcons.mail;
    }else if(addresse){
      return FluentIcons.location;
    }else if(password){
      return FluentIcons.laptop_secure;
    }else{
      return FluentIcons.generate;
    }
  }
  bool notSimpleWidget(){
    if(email||addresse||password){
      return true;
    }else{
      return false;
    }
  }
  String? getValidator(value){
    if(email){
      return null;
    }else if(addresse){

    }else if(password){
      return null;
    }else{
      return null;
    }
  }



  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  void initState() {
    widget.value==null?null:widget.controller.value=TextEditingValue(text:widget.value.toString());
    super.initState();
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
                              widget.value==null?widget.controller.clear()
                              :widget.controller.value=TextEditingValue(text: widget.value.toString());
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
                            widget.value=widget.controller.text;
                            widget.onFieldSubmitted!(widget.controller.text);
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
            keyboardType: widget.getKeyboardType(),
            style: AppTextStyle.formStyleTexte,
            readOnly: widget.readOnly,
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
            onChanged: (value) => widget.onChanged!(value),
            onFieldSubmitted: (value) {
              widget.value=value;
              widget.onFieldSubmitted!(value);
              setState(() {
                widget.readOnly = true;
              });
            },
            validator: (value) => widget.getValidator(value),
            inputFormatters: [
              TextInputFormatter.withFunction((oldValue, newValue) => newValue),
            ],
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
            obscureText: widget.password? widget.showPassword:false,
            obscuringCharacter: "*",
            prefix: widget.notSimpleWidget()?Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Icon(
                      widget.getIcon(),
                      size: 25.h,
                      color: AppColors.bleu,
                    ),
                  ),
                ],
              ),
            ):null,
            suffix: widget.password?IconButton(
              onPressed: (){
                setState(() {
                  widget.showPassword=!widget.showPassword;
                });
              },
              icon: Icon(widget.showPassword? FluentIcons.visually_impaired: FluentIcons.red_eye,color: widget.showPassword?AppColors.bleu:AppColors.gris,size: 30.h,),
            ):null,
          ),
        ],
      ),
    );
  }
}

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';


class SuivisTile extends StatefulWidget {
  String title;
  SuivisTile({Key? key,this.title="Suivi"}) : super(key: key);

  @override
  State<SuivisTile> createState() => _SuivisTileState();
}

class _SuivisTileState extends State<SuivisTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(right:5.w),
      decoration: BoxDecoration(
        color: AppColors.rouge.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.only(left: 20.w, right:20.w),
        decoration: BoxDecoration(
          border: Border.all(
              strokeAlign: BorderSide.strokeAlignOutside,
              width: 1,
              color: AppColors.grisLite.withOpacity(0.2)
          ),
          color: AppColors.blancGrise,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(FluentIcons.arrange_send_to_back,size: 30.h,color: AppColors.rouge,),
            Gap(20.w),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 3,
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(30),
                  color: AppColors.rouge.withOpacity(0.1),
                ),
              ),
            ),
            Gap(20.w),
            Expanded(child: Text(widget.title, style: AppTextStyle.bigFilledTexte.copyWith(fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,)),
            Gap(20.w),
            Text("10 Janvier 2022",style: AppTextStyle.smallTexte.copyWith(fontWeight: FontWeight.w900),),
          ],
        )),
      ),
    );
  }
}

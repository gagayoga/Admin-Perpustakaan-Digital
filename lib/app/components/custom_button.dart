import 'package:admin/app/style/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? childWidget;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.10),
          ),
        ),
        onPressed: onPressed,
        child: childWidget,
        // Text(
        //   buttonText,
        //   style: GoogleFonts.montserrat(
        //     fontSize: AppTextSizes.textButton,
        //     color: AppColors.whiteColor,
        //     fontWeight: FontWeight.w700,
        //   ),
        // ),
      ),
    );
  }
}

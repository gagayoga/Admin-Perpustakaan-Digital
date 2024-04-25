import 'package:admin/app/components/customTextField.dart';
import 'package:admin/app/components/custom_button.dart';
import 'package:admin/app/style/color.dart';
import 'package:admin/app/style/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppSizes sizes = AppSizes(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Login Admin Perpustakaan', style: GoogleFonts.lato(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SizedBox(
        width: sizes.sizeWidth,
        height: sizes.sizeHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(child: sectionLogin()),
        ),
      )
    );
  }

  Widget sectionLogin(){
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Email",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              CustomTextField(
                  controller: controller.emailController,
                  maxlines: 1,
                  hinText: "Masukan email",
                  obsureText: false
              ),

              const SizedBox(
                height: 10,
              ),

              Text(
                "Password",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              Obx(()=> CustomTextField(
                    controller: controller.passwordController,
                    maxlines: 1,
                    hinText: "Masukan password",
                    surficeIcon: InkWell(
                      child: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 20,
                        color: AppColor.primaryColor,
                      ),
                      onTap: () {
                        controller.isPasswordHidden.value =
                        !controller.isPasswordHidden.value;
                      },
                    ),
                    obsureText: controller.isPasswordHidden.value,
                  ),
              ),

              const SizedBox(
                height: 35,
              ),

              CustomButton(
                  onPressed:
                  (){
                    controller.login();
                  },
                  childWidget: Obx(() => controller.loading.value?
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ): Text(
                    "Login",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ))),
            ],
          ),
        ],
      ),
    );
  }
}

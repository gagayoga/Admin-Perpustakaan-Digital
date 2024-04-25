import 'package:admin/app/style/sizes.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/customTextField.dart';
import '../../../style/color.dart';
import '../controllers/addbook_controller.dart';

class AddbookView extends GetView<AddbookController> {
  const AddbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    AppSizes sizes = AppSizes(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Add Buku Perpustakaan', style: GoogleFonts.lato(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: sizes.sizeWidth,
        height: sizes.sizeHeight,
        child:  kontenAddBook(),
      )
    );
  }

  Widget kontenAddBook(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        const SizedBox(
          height: 30,
        ),

        Text(
          "Upload Buku",
          style: GoogleFonts.lato(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 30
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  "Judul Buku",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              CustomTextField(
                  controller: controller.passwordController,
                  hinText: "Masukan judul buku",
                  obsureText: false
              ),

              const SizedBox(height: 10),

              Text(
                "Deskripsi Buku",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              CustomTextField(
                  controller: controller.passwordController,
                  maxlines: 5,
                  hinText: "Masukan deskripsi buku",
                  obsureText: false
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Penulis Buku",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                        CustomTextField(
                            controller: controller.passwordController,
                            maxlines: 1,
                            hinText: "Masukan penulis buku",
                            obsureText: false
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Penerbit Buku",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                        CustomTextField(
                            controller: controller.passwordController,
                            maxlines:1,
                            hinText: "Masukan penerbit buku",
                            obsureText: false
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Tahun Terbit",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                        CustomTextField(
                            controller: controller.passwordController,
                            maxlines:1,
                            hinText: "Masukan tahun terbit",
                            obsureText: false
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Jumlah Halaman",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                        CustomTextField(
                            controller: controller.passwordController,
                            maxlines:1,
                            hinText: "Masukan jumlah halaman",
                            obsureText: false
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

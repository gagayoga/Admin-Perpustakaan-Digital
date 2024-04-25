import 'package:admin/app/routes/app_pages.dart';
import 'package:admin/app/style/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../style/color.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppSizes sizes = AppSizes(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Dashboard Admin Perpustakaan', style: GoogleFonts.lato(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SizedBox(
        width: sizes.sizeWidth,
        height: sizes.sizeHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: kontenDashboard(context),
        ),
      )
    );
  }

  Widget kontenDashboard(BuildContext context){
    AppSizes sizes = AppSizes(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cardFitur(
            context,
            150,
            (){
              Get.toNamed(Routes.BOOK);
            },
            "assets/home/fitur1.png",
            "Pendataan Buku",
            "Data-data buku perpustakaan"
        ),
        const SizedBox(
          height: 5,
        ),
        cardFitur(
            context,
            150,
                (){

            },
            "assets/home/fitur2.png",
            "Pendataan Peminjaman",
            "Data-data peminjaman buku perpustakaan"
        ),
      ],
    );
  }

  Widget cardFitur(BuildContext context, double height, Function() onTap, String urlImage, String namaFitur, String deskripsi){
    AppSizes sizes = AppSizes(context);
    return SizedBox(
      width: sizes.sizeWidth,
      height: 150,
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: AppColor.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Image.asset(
                urlImage,
                width: 150,
                height: 130,
                fit: BoxFit.fitHeight,
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        namaFitur,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 28
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        deskripsi,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

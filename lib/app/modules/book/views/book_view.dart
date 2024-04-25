import 'package:admin/app/routes/app_pages.dart';
import 'package:admin/app/style/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../style/color.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppSizes sizes = AppSizes(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Pendataan Buku Perpustakaan', style: GoogleFonts.lato(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: sizes.sizeWidth,
        height: sizes.sizeHeight,
        child: Stack(
          children: [
            Obx(()=> sectionKoleksiBuku()),

            Positioned(
              right: 20,
              bottom: 20,
              child: InkWell(
                onTap: (){
                  Get.toNamed(Routes.ADDBOOK);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.primaryColor
                  ),
                  child: const Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )
      )
    );
  }

  Widget kontenDataBuku(){
    return Obx((){
      return Column(
        children: [
          const Column(
            children: [

            ],
          ),
          sectionKoleksiBuku(),
        ],
      );
    });
  }

  Widget sectionKoleksiBuku() {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            children:
            List.generate(
              controller.dataBook.length,
                  (index) {
                var dataKoleksi = controller.dataBook[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: MediaQuery.of(Get.context!).size.width,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5).withOpacity(0.60),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    height: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Gambar di sebelah kiri
                        Flexible(
                          flex:3,
                          child: InkWell(
                            onTap: (){
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 150,
                                decoration : BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: const Offset(0, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                // Lebar gambar 40% dari layar
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: AspectRatio(
                                    aspectRatio: 2 / 2,
                                    child: Image.network(
                                      dataKoleksi.coverBuku.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),


                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataKoleksi.judul!,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF260534),
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  dataKoleksi.deskripsi!,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Penulis : ${dataKoleksi.penulis!}",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 12.0,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    "Created At : ${dataKoleksi.createdAt.toString()}",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 12.0,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
        )
    );
  }
}

import 'package:admin/app/data/models/response_kategori.dart';
import 'package:admin/app/style/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/customTextField.dart';
import '../../../components/custom_button.dart';
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
      body: SizedBox(
        width: sizes.sizeWidth,
        height: sizes.sizeHeight,
        child:  SingleChildScrollView(child: kontenAddBook()),
      )
    );
  }

  Widget kontenAddBook(){
    const Color backgroundInput = Color(0xFFF8F8F8);
    const Color colorBorder = Color(0xFF020925);
    const Color background = Color(0xFF03010E);
    const Color colorText = Color(0xFFEA1818);
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
          child: Form(
            key: controller.formKey,
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
                    controller: controller.judul,
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
                    controller: controller.deskripsi,
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
                              controller: controller.penulis,
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
                              controller: controller.penerbit,
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
                              controller: controller.tahunterbit,
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
                              controller: controller.jumlahhalaman,
                              maxlines:1,
                              hinText: "Masukan jumlah halaman",
                              obsureText: false
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Obx(
                      () => (controller.dataKategori.isNotEmpty)
                      ? DropdownButtonFormField<DataKategori>(
                        decoration: InputDecoration(
                          fillColor: backgroundInput,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorBorder.withOpacity(0.90),
                              ),
                              borderRadius: BorderRadius.circular(10.10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorBorder.withOpacity(0.90),
                              ),
                              borderRadius: BorderRadius.circular(10.10)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorBorder.withOpacity(0.90),
                              ),
                              borderRadius: BorderRadius.circular(10.10)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: colorBorder.withOpacity(0.90),
                            ),
                            borderRadius: BorderRadius.circular(10.10),
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                          hintText: "Pilih kategori buku",
                          hintStyle: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          )
                        ),
                    value: controller.selectedKategori.value,
                    items: controller.dataKategori.map((kategori) {
                      return DropdownMenuItem<DataKategori>(
                        value: kategori,
                        child: Text(kategori.namaKategori ?? "Kosong"),
                      );
                    }).toList(),
                          onChanged: (selectedItem) {
                            if (selectedItem != null) {
                              controller.idKategori = selectedItem.kategoriID!;
                              controller.selectedKategori.value = selectedItem;
                              print('ID Kategori: ${selectedItem.kategoriID}');
                              print(controller.idKategori = selectedItem.kategoriID!);
                            }
                          }

                      )
                      : const CircularProgressIndicator(),
                ),

                const SizedBox(height: 35),

                CustomButton(
                    onPressed:
                        (){
                      controller.postBuku();
                    },
                    childWidget: Obx(() => controller.loading.value?
                    const CircularProgressIndicator(
                      color: Colors.white,
                    ): Text(
                      "Add Buku",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ))),
              ],
            ),
          ),
        )
      ],
    );
  }
}

import 'package:admin/app/data/models/response_kategori.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class AddbookController extends GetxController with StateMixin{
  var dataKategori = RxList<DataKategori>();
  final TextEditingController judul = TextEditingController();
  final TextEditingController deskripsi = TextEditingController();
  final TextEditingController penulis = TextEditingController();
  final TextEditingController penerbit = TextEditingController();
  final TextEditingController tahunterbit = TextEditingController();
  final TextEditingController jumlahhalaman = TextEditingController();
  var selectedKategori = Rx<DataKategori?>(null);
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    selectedKategori.value = dataKategori.isNotEmpty ? dataKategori.first : null;
    getDataKategori();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getDataKategori() async {
    change(null, status: RxStatus.loading());

    try {
      final responseBuku = await ApiProvider.instance().get(Endpoint.kategori);

      if (responseBuku.statusCode == 200) {
        final ResponseKategori responseDataBook = ResponseKategori.fromJson(responseBuku.data);

        if (responseDataBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          dataKategori.assignAll(responseDataBook.data!);
          change(null, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData != null) {
          final errorMessage = responseData['message'] ?? "Unknown error";
          change(null, status: RxStatus.error(errorMessage));
        }
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  postBuku() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.book,
            data: dio.FormData.fromMap(
                {
                  "Judul": judul.text.toString(),
                  "Deskripsi": deskripsi.text.toString(),
                  "Penulis": penulis.text.toString(),
                  "Penerbit": penerbit.text.toString(),
                  "TahunTerbit": tahunterbit.text.toString(),
                  "JumlahHalaman": jumlahhalaman.text.toString(),
                  "id_kategori[]": selectedKategori.value,
                }
            )
        );
        if (response.statusCode == 200) {
          Get.back();
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.red);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}

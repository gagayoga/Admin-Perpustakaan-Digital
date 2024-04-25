import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/models/response_login.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isPasswordHidden = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    String status = StorageProvider.read(StorageKey.status);
    if(status == "logged"){
      Get.off(Routes.DASHBOARD);
    }
  }

  @override
  void onReady() {
    super.onReady();

    String status = StorageProvider.read(StorageKey.status);
    if(status == "logged"){
      Get.off(Routes.DASHBOARD);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: dio.FormData.fromMap(
                {
                  "email": emailController.text.toString(),
                  "password": passwordController.text.toString()
                }
            )
        );
        if (response.statusCode == 200) {
          ResponseLogin responseLogin = ResponseLogin.fromJson(response.data);
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(StorageKey.username, responseLogin.data!.username.toString());
          await StorageProvider.write(StorageKey.idUser, responseLogin.data!.id.toString());
          await StorageProvider.write(StorageKey.bearerToken, responseLogin.data!.token.toString());
          Get.offAllNamed(Routes.DASHBOARD);
          Get.snackbar("Success", "Login Berhasil", backgroundColor: Colors.green, colorText: Colors.white);
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

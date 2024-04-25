import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/models/response_book.dart';
import '../../../data/provider/api_provider.dart';

class BookController extends GetxController with StateMixin{
  var dataBook = RxList<DataBook>();

  @override
  void onInit() {
    super.onInit();
    getDataBook();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getDataBook() async {
    dataBook.clear();
    change(null, status: RxStatus.loading());

    try {
      final responseBuku = await ApiProvider.instance().get(Endpoint.book);

      if (responseBuku.statusCode == 200) {
        final ResponseBook responseDataBook = ResponseBook.fromJson(responseBuku.data);

        if (responseDataBook.data!.isEmpty) {
          dataBook.clear();
          change(null, status: RxStatus.empty());
        } else {
          dataBook.assignAll(responseDataBook.data!);
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
}

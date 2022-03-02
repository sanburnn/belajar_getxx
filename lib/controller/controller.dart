import 'package:belajar_getxx/model/nowPlaying.dart';
import 'package:belajar_getxx/services/resource.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var productList = <NowplayingModel>[].obs;

  @override
  void onInit() {
    fetchProduk();
    super.onInit();
  }

  void fetchProduk() async {
    try {
      isLoading(true);
      var produk = await ApiProvider().getNowPlaying();
      if (produk != null) {
        productList.value = produk;
      }
    } finally {
      isLoading(false);
    }
  }
}

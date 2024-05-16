import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/features/shop/model/offers/offer_model.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  RxList offerList = [].obs;
  final carousalCurrentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchOfferData();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchOfferData() async {
    try {
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot = await db.collection('offers').get();

      final List<OfferModel> fetchedofferlist = querySnapshot.docs
          .map((doc) => OfferModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      offerList.assignAll(fetchedofferlist);

      print(
          'offerslist$offerList'); // Return true to indicate successful data fetching
      print('offers data fetched successfully!');
    } catch (e) {
      print('Error fetching offers data: $e');
    }
  }
}

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:purity_pallette/features/shop/model/cart/cart_item_model.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/utils/local_storage/storage_utility.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  CartController() {
    loadCartItems();
  }
  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      SLoaders.customToast(message: "Select Quantity");
      return;
    }
    if (product.number < 1) {
      SLoaders.warningSnackBar(title: "Selected product is out of stock");
    }
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);
    int index =
        cartItems.indexWhere((cartItem) => cartItem.id == selectedCartItem.id);
    if (index >= 0) {
      //this quantity is already in cart
      cartItems[index].number = selectedCartItem.number;
    } else {
      cartItems.add(selectedCartItem);
    }
    updateCart();
    SLoaders.customToast(message: "Your product has been added to the cart");
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (index >= 0) {
      cartItems[index].number += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (index >= 0) {
      if (cartItems[index].number > 1) {
        cartItems[index].number -= 1;
      } else {
        cartItems[index].number == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove the product',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        SLoaders.customToast(message: "remove from cart");
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNumberOfItems = 0;
    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.number.toDouble();
      calculatedNumberOfItems += item.number;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNumberOfItems;
  }

  void saveCartItems() {
    final cartItemString = cartItems.map((item) => item.toJson()).toList();
    SLocalStorage.instance().saveData("cartItems", cartItemString);
  }

  CartItemModel convertToCartItem(ProductModel product, int number) {
    final price = product.price;
    return CartItemModel(
        id: product.id,
        number: number,
        price: price,
        image1: product.image1,
        brandName: product.brand.name,
        productName: product.productName);
  }

  void loadCartItems() {
    final cartItemStrings =
        SLocalStorage.instance().readData<List>("cartItems");
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItems = cartItems
        .where((item) => item.id == productId)
        .fold(0, (previousValue, element) => previousValue + element.number);
    return foundItems;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}

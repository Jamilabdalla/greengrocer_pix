import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer_course/src/config/custom_colors.dart';
import 'package:greengrocer_course/src/models/cart_item_model.dart';
import 'package:greengrocer_course/src/pages/cart/controller/cart_controller.dart';
import 'package:greengrocer_course/src/pages/common_widgets/quantity_widget.dart';
import 'package:greengrocer_course/src/services/utils_services.dart';

class CartTile extends StatefulWidget {

  final CartItemModel cartItem; 

  CartTile({ 
    Key? key,
    required this.cartItem
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilServices utilServices = UtilServices();

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: ListTile(
        leading: Image.network(widget.cartItem.item.imgUrl, height: 60, width: 60),
        title: Text(widget.cartItem.item.itemName, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(utilServices.priceToCurrency(widget.cartItem.totalPrice()), style: TextStyle(color: CustomColors.customPrimaryColor, fontWeight: FontWeight.bold)),
        trailing: QuantityWidget(
          value: widget.cartItem.quantity, 
          suffixText: widget.cartItem.item.unit, 
          isRemovable: true,
          result: (int quantity) { 
            controller.changeItemQuantity(
              item: widget.cartItem, 
              quantity: quantity
            );           
          }
        ),
      ),
    );
  }
}
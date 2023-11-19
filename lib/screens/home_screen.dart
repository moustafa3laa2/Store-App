import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stroe_app/model/product_model.dart';
import 'package:stroe_app/services/get_all_product_services.dart';
import 'package:stroe_app/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.black,
              ))
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: AllProductServices().getAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 65),
              child: GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //عدد الكولوم ال عايزها تتعرض عندي
                    crossAxisSpacing: 10, //المسافه بين الكولم
                    childAspectRatio:
                        1.5, // بتحكم ف العرض بالنسبه للطول كل مقلل الرقم العشري كل م الطول يكبر
                    mainAxisSpacing: 100, //المسافه بين كل صف
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(product: products[index]);
                  }),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

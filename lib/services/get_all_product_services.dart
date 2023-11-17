import 'package:stroe_app/helper/api.dart';
import 'package:stroe_app/model/product_model.dart';

class AllProductServices {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }

  // Future<List<ProductModel>> getAllProduct() async {
  //   http.Response response = await http.get(
  //     Uri.parse('https://fakestoreapi.com/products'),
  //   );

  //   if (response.statusCode == 200) {
  //     List<dynamic> data = jsonDecode(response.body);
  //     List<ProductModel> productList = [];
  //     for (int i = 0; i < data.length; i++) {
  //       productList.add(
  //         ProductModel.fromJson(data[i]),
  //       );
  //     }
  //     return productList;
  //   } else {
  //     throw Exception(
  //         'there is a problem with status code ${response.statusCode}');
  //   }
  // }
}

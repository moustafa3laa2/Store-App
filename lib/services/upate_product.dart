import 'package:stroe_app/helper/api.dart';
import 'package:stroe_app/model/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct(
      {required String id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
       Map<String,dynamic> data= await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}

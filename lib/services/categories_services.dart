import 'package:stroe_app/helper/api.dart';
import 'package:stroe_app/model/product_model.dart';

class GetCategory {
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> categorisList = [];
    for (int i = 0; i < data.length; i++) {
      categorisList.add(ProductModel.fromJson(data[i]));
    }
    return categorisList;
  }
}

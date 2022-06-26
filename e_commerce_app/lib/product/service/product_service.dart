import 'package:e_commerce_app/product/model/product/product.dart';
import 'package:e_commerce_app/product/network/network_manager.dart';
import 'package:e_commerce_app/product/utility/service_paths.dart';

abstract class IProductService {
  final ProjectNetworkManager networkManager;
  IProductService(this.networkManager);
  Future<List<Product>> getProductCategories();
}

class ProductService extends IProductService {
  ProductService() : super(ProjectNetworkManager.instance);

  @override
  Future<List<Product>> getProductCategories() async {
    final response = await networkManager.service
        .get(ServicePaths.productsForaCategoryEndPoint.path);
    var data = response.data["products"];

    if (data is List<dynamic>) {
      List<Product> products = [];
      for (var productData in data) {
        final item = Product.fromJson(productData);

        products = [...products, item];
      }
      return products;
    }
    return [];
  }
}

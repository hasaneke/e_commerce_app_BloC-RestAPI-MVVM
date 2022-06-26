enum ServicePaths {
  login('/auth/login'),
  register('/users/add'),
  productsForaCategoryEndPoint('/products/category/laptops');

  final String path;
  const ServicePaths(this.path);
}

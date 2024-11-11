enum FoodMenu {
  Pizza(8.99),
  Burger(5.49),
  Pasta(7.99),
  Sushi(12.49),
  Salad(4.99);

  final double price;
  const FoodMenu(this.price);
}

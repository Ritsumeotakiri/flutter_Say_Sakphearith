void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  double total = 0;
  List<String> invalidPizzas = [];

  for (var pizza in order) {
    if (pizzaPrices.containsKey(pizza)) {
      total += pizzaPrices[pizza]!;// if we find the pizza we will add the price to the total
    } else {
      invalidPizzas.add(pizza); // if there are no name it will add the pizza to the dont have list
    }
  }
  print('Total: \$${total}');

  if (invalidPizzas.isNotEmpty) {
    for (var pizza in invalidPizzas) {
      print('$pizza is not on the menu');
    }
  }
}

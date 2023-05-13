import 'package:flutter/material.dart';


class CartItem {
  final String name;
  final double price;

  CartItem({required this.name, required this.price});
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> _cartItems = [    CartItem(name: '2 meter pipe', price: 200),    CartItem(name: '1 plastic tap', price: 100),CartItem(name: '1 Kg pop', price: 450),CartItem(name: '1 plastic tape', price: 100),CartItem(name: '1 plastic tap', price: 100),  ];

  double get totalAmount => _cartItems.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_cartItems[index].name),
                  trailing: Text('\$${_cartItems[index].price}'),
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Total'),
            trailing: Text('\$$totalAmount'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(totalAmount: totalAmount),
                ),
              );
            },
            child: Text('Task done'),
          ),
        ],
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final double totalAmount;

  const PaymentPage({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Total Amount: \$$totalAmount'),
            ElevatedButton(
              onPressed: () {
                // Add your payment processing logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Request sent Successfully!!!!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Request for Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

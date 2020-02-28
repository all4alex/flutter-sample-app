import 'package:flutter/material.dart';
import 'package:flutter_app/providers/orders.dart';
import 'package:flutter_app/widgets/navigation_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart' as ord;

class OrdersScreen extends StatelessWidget{
  static const routName = '/order-screen';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('orders'),
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => ord.OrderItem(orderData.orders[i])
      ),
    );
  }

}
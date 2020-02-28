import 'package:flutter/material.dart';
import 'package:flutter_app/providers/cart.dart';
import 'package:flutter_app/providers/orders.dart';
import 'package:flutter_app/providers/products.dart';
import 'package:flutter_app/widgets/navigation_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import 'package:flutter_app/widgets/cart_item.dart' as cartWidgetItem;

class CartScreen extends StatelessWidget {

  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orders = Provider.of<Orders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart"),
      ),
      drawer: NavigationDrawer(),

      body: Column(
        children: <Widget>[
          Card(margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Consumer<Cart> (builder: (_, cart, ch) =>(
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total', style: TextStyle(fontSize: 20,),),
                  Chip(label: Text('\$${cart.totalPrice}', style: TextStyle(color: Theme.of(context).primaryTextTheme.title.color),),
                  backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(child: Text('ORDER NOW'), textColor: Theme.of(context).primaryColor,onPressed: (){
                    orders.addOrder(cart.items.values.toList(), cart.totalPrice);
                    cart.clearCartItems();

                  },),
                ],
              )
            )),
          ),
          ),
//          SizedBox(height: 10),
          Expanded(child: ListView.builder(itemCount: cart.items.length, itemBuilder: (context, i)
          => cartWidgetItem.CartItem(
              cart.items.values.toList()[i].id,
              cart.items.keys.toList()[i],
              cart.items.values.toList()[i].price,
              cart.items.values.toList()[i].quantity,
              cart.items.values.toList()[i].title), ), )

        ],
      ),
    );
  }
}

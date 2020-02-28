import 'package:flutter/material.dart';
import 'package:flutter_app/enums/filter_options.dart';
import 'package:flutter_app/providers/cart.dart';
import 'package:flutter_app/providers/products.dart';
import 'package:flutter_app/screens/cart_screen.dart';
import 'package:flutter_app/widgets/badge.dart';
import 'package:flutter_app/widgets/navigation_drawer.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption selectedValue){
              setState(() {
                if(selectedValue == FilterOption.Favorites){
                  _showOnlyFavorites = true;
                }else{
                  _showOnlyFavorites = false;
                }
              });
            },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(child: Text('Only Favorites'), value: FilterOption.Favorites,),
                PopupMenuItem(child: Text('All items'), value: FilterOption.All,)

              ],
          ),
          Consumer<Cart>(builder: (_, cart, ch) => Badge(
            child: ch,
            value: cart.itemCount.toString(),
              ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                Navigator.of(context).pushNamed(
                    CartScreen.routeName,
                );
              },
            ),

          )

        ],
      ),
      drawer: NavigationDrawer(),

      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}

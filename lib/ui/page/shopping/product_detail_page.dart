import 'package:flutter/material.dart';
import 'package:hello_flutter/inherited/product_provider.dart';
import 'package:hello_flutter/logic/bloc/product_bloc.dart';
import 'package:hello_flutter/model/product.dart';
import 'package:hello_flutter/ui/page/shopping/product_detail/product_detail_widget.dart';
import 'package:hello_flutter/ui/widgets/login_background.dart';

class ProductDetailPage extends StatelessWidget {

  Widget productScaffold(Stream<List<Product>> products) => new Scaffold(
    backgroundColor: Color(0xffeeeeee),
    body: StreamBuilder<List<Product>>(
      stream: products,
      builder: (context, snapshot) {
        return snapshot.hasData ? Stack(
          fit: StackFit.expand,
          children: <Widget>[
            LoginBackground(
              showIcon: false,
            ),
            ProductDetailWidget(product: snapshot.data[0]),
          ],
        ): Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    ProductBloc productBloc = ProductBloc();
    return ProductProvider(
      productBloc: productBloc,
      child: productScaffold(productBloc.productItems),
    );
  }
}
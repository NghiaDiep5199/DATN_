import 'package:ecommerce_supplier_app/widgets/appbar_wiget.dart';
import 'package:flutter/material.dart';

class MyStore extends StatelessWidget {
  const MyStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'My Store'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}

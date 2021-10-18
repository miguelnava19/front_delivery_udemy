import 'package:flutter/material.dart';

class ClientProductListPage extends StatefulWidget {
  const ClientProductListPage({Key? key}) : super(key: key);

  @override
  _ClientProductListPageState createState() => _ClientProductListPageState();
}

class _ClientProductListPageState extends State<ClientProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('LISTA DE PRODUCTOS')
      )
    );
  }
}

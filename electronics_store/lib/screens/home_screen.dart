import 'package:electronics_store/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/home/home_body.dart';
// import 'package:flutter_localization/flutter_localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: homeAppBar(),
      body: const HomeBody(),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      // shadowColor: Colors.yellow,
      elevation: 0,
      title: const Text(
        'Welcome To The Electronics Store',
        // "مرحبا بكم بمتجر الإلكترونيات",
        style: TextStyle(fontSize: 17.0, color: Colors.white),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

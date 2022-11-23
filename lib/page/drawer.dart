import 'package:counter_7/page/mywatchlist_page.dart';
import 'package:flutter/material.dart';
import 'form.dart';
import 'data.dart';
import 'package:counter_7/main.dart';

class MyDrawer extends StatefulWidget {
  var theBudget;
  MyDrawer({super.key, this.theBudget});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text("counter_7"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
          ),
          ListTile(
            title: const Text("Tambah Budget"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Data Budget"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyDataPage(
                        myBudget: widget.theBudget,
                      )));
            },
          ),
          ListTile(
            title: const Text('Watchlist'),
            onTap: () {
              // Route menu ke halaman to do
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
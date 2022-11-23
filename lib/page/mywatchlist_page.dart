import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/mywatchlist_page_specific.dart';



class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key});
  final String title = 'My Watch List';

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  late Future<List<MyWatchList>> futureMyWatchList;

  @override
  void initState() {
    super.initState();
    futureMyWatchList = fetchMyWatchlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: MyDrawer(),
        body: FutureBuilder<List<MyWatchList>>(
            future: futureMyWatchList,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Card(
                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),

                    ),
                    child: InkWell(
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${snapshot.data![index].fields.title}",
                                style: const TextStyle(
                                  // fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                            ],
                          )
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WatchlistSpecific(watchlist: snapshot.data![index])),
                        );
                      },
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            }
        )
    );
  }
}

import 'package:counter_7/model/mywatchlist.dart';
import 'package:flutter/material.dart';

class WatchlistSpecific extends StatefulWidget {
  const WatchlistSpecific({super.key, required this.watchlist});

  final String title = 'Movie Detail';
  final MyWatchList watchlist;

  @override
  State<WatchlistSpecific> createState() => _WatchlistSpecificState();
}

class _WatchlistSpecificState extends State<WatchlistSpecific> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //untuk menghapus automatic backbutton di appbar
        title: Text(widget.title),

      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.watchlist.fields.title.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: RichText(
                      text: TextSpan(
                          children: [
                            const TextSpan(text: 'Release Date: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: widget.watchlist.fields.releaseDate.toString())                          ],
                          style: const TextStyle(color: Colors.black87, fontFamily: 'Arial')
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: RichText(
                      text: TextSpan(
                          children: [
                            const TextSpan(text: 'Rating: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: widget.watchlist.fields.rating.toString())
                          ],
                          style: const TextStyle(color: Colors.black87, fontFamily: 'Arial')
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: RichText(
                      text: TextSpan(
                          children: [
                            const TextSpan(text: 'Status: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: widget.watchlist.fields.watched.toString()) ],
                          style: const TextStyle(color: Colors.black87, fontFamily: 'Arial')
                      )
                  ),
                ),
                RichText(
                    text: const TextSpan(
                        children: [
                          TextSpan(text: 'Review: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                        style: TextStyle(color: Colors.black87, fontFamily: 'Arial')
                    )
                ),
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: widget.watchlist.fields.review)
                        ],
                        style: const TextStyle(color: Colors.black87, fontFamily: 'Arial')
                    )
                ),
                Align(
                  alignment: Alignment.bottomCenter,

                  child: MaterialButton(
                    minWidth: double.maxFinite, // set minWidth to maxFinite
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {Navigator.pop(context);},
                    child: Text("Back"),
                  )

                )
              ],
            )
        ),
      ),
    );
  }
}

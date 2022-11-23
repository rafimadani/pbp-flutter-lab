import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'form.dart';
import 'budget.dart';
import 'drawer.dart';

class MyDataPage extends StatefulWidget {
  var myBudget;
  MyDataPage({super.key, this.myBudget});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Budget"),
      ),
      drawer: MyDrawer(
        theBudget: widget.myBudget,
      ),
      body: Column(
        children: [
          if (widget.myBudget == null)
            const Center(
              child: Text("Data Kosong"),
            )
          else if (widget.myBudget.length == 0)
            const Center(
              child: Text("Data Kosong"),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: widget.myBudget.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title: Text(widget.myBudget[index]
                            .judul),
                        subtitle: Text(widget.myBudget[index]
                            .nominal.toString()),
                        trailing: Column(
                          children: [
                            Text(widget.myBudget[index].jenis),
                            Text(widget.myBudget[index].date.toString()),
                          ],
                        )),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

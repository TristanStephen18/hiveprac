import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hiveprac/boxes/boxes.dart';
import 'package:hiveprac/data/input.dart';

class Viewscreen extends StatefulWidget {
  const Viewscreen({super.key});

  @override
  State<Viewscreen> createState() => _ViewscreenState();
}

var namecon = TextEditingController();

class _ViewscreenState extends State<Viewscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Practice Again"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: namecon,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: const Text('Input'),
                ),
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      datainputBox.put('key_${namecon.text}', Datainput(input: namecon.text));
                    });
                  }, child: const Text('Add')),
                  Gap(20),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      datainputBox.clear();
                    });
                  }, child: const Text('Delete All'))
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: datainputBox.length,
                    itemBuilder: (BuildContext context, int index) {
                      Datainput datagetter = datainputBox.getAt(index);
                      return Dismissible(
                        background: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          child: Icon(Icons.delete),
                        ),
                        direction: DismissDirection.horizontal,
                        onDismissed: (direction) {
                          setState(() {
                            datainputBox.deleteAt(index);
                          });
                        },
                        key: Key(datainputBox.keyAt(index)), 
                        child: Card(
                          elevation: 18,
                          child: ListTile(
                            title: Text(datagetter.input),
                            leading: IconButton(onPressed: (){
                              setState(() {
                                datagetter.isfav = !datagetter.isfav;
                              });
                            },
                            icon: Icon(datagetter.isfav ? Icons.favorite : Icons.favorite_outline)),
                          ),
                        ) 
                        );
                    },
                  ),
              ),
          ]
          ),
      ),
    );
  }
}
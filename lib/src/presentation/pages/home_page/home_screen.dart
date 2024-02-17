import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Olma Market',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 4, left: 10, right: 10),
          child: Card(
            shadowColor: const Color(0xff9745FF),
            elevation: 4,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '90000',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              actions: [
                                TextButton(
                                  onPressed: () {

                                  },
                                  child: const Text("Yes"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No"),
                                )
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        CupertinoIcons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                title: const Text('Gurgut'),
                subtitle: const Row(
                  children: [
                    Text(
                      '7324897293',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '10.20.2023',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

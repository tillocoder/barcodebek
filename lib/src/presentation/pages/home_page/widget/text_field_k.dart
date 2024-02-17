import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KTextField extends StatelessWidget {
  const KTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                onPressed: () {},
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
    );
  }
}

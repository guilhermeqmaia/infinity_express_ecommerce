
import 'package:flutter/material.dart';

class BottomDisplayContainer extends StatelessWidget {
  const BottomDisplayContainer({
    Key? key,
    required this.total,
  }) : super(key: key);
  final String total;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.brown,
            width: 2,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Total',
            style: TextStyle(
              color: Colors.brown,
              fontSize: 25,
              fontFamily: 'Montserrat',
            ),
          ),
          Text(
            total,
            style: const TextStyle(
              color: Colors.brown,
              fontSize: 22,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}
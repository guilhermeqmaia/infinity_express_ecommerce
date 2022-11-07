
import 'package:flutter/material.dart';

class TopDisplayContainer extends StatelessWidget {
  const TopDisplayContainer({
    Key? key,
  }) : super(key: key);

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
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            'Carrinho',
            style: TextStyle(
                color: Colors.brown, fontSize: 25, fontFamily: 'Montserrat'),
          ),
          Icon(
            Icons.local_mall,
            size: 25,
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}
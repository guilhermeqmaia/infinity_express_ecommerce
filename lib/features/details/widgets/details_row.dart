import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({
    Key? key,
    required this.label,
    required this.value,
    this.isTextLineTrough,
  }) : super(key: key);
  final String label;
  final String value;
  final bool? isTextLineTrough;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
              fontSize: 25,
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.brown,
                fontSize: 25,
                decoration: isTextLineTrough != null
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

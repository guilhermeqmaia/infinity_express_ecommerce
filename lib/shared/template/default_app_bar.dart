import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  const DefaultAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: const TextStyle(
        color: Colors.brown,
        fontSize: 30,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.bold,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.brown,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.home,
            color: Colors.brown,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/products');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}

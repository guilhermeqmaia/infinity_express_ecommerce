import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Infinity Express',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 50,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Buy All You Need',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Text(
                      'With The Price You Want',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: double.maxFinite,
                color: Colors.brown,
                height: 45,
                onPressed: () => Navigator.pushReplacementNamed(context, '/products'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5),
                ),
                child: const Text(
                  'See The Products',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:final_project/Core/Colors/all_colors.dart';
import 'package:final_project/features/Cart/view/Screens/cart_screen.dart';
import 'package:flutter/material.dart';

class TopRow extends StatefulWidget {
  const TopRow({super.key});

  @override
  State<TopRow> createState() => _TopRowState();
}

class _TopRowState extends State<TopRow> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('YME STORE',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              icon: Image.asset('assets/bag2.png',color: Colors.white,fit: BoxFit.cover,),
            ),
          ),
        ],
      ),
    );
  }
}

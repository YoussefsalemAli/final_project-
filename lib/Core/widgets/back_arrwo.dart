
import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
   required  this.onPressed,
  });
final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed, 
      icon: Image.asset('assets/arrowleft2.png'));
  }
}

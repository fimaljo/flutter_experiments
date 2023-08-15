import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatfromIndicator {
  Color color();
  Widget build();
  
}

class AndroidIndicator extends PlatfromIndicator {
  @override
  Widget build() {
    return CircularProgressIndicator(
      color: color(),
    );
  }

  @override
  Color color() {
    return Colors.blue;
  }
}
class IosIndicator implements PlatfromIndicator {
  @override
  Widget build() {
    return CupertinoActivityIndicator(
      color: color(),
    );
  }

  @override
  Color color() {
    return Colors.red;
  }
}

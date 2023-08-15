// factory method pattern is a cretional design pattern
// 3 types patterns 1. creational 2.structural 3.behaviour
// this is creational
// means this is for creating objects at the time of instantiation of a class

//DART EXAMPLE
// DART EXAMPLE
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EmployeeType {
  programmer,
  boss,
  hr,
}

abstract class Employee {
  void work();
  // 1st Approach
  factory Employee(EmployeeType type) {
    switch (type) {
      case EmployeeType.programmer:
        return Programmer();
      case EmployeeType.hr:
        return HRManager();
      case EmployeeType.boss:
        return Boss();
      default:
        return Programmer();
    }
  }
}

class Programmer implements Employee {
  @override
  void work() {
    print('coding an app');
  }
}

class HRManager implements Employee {
  @override
  void work() {
    print('recruiting people');
  }
}

class Boss implements Employee {
  @override
  void work() {
    print('leading the people');
  }
}

// Alternate Approach
class FactoryMethod {
  static Employee getEmployee(String type) {
    switch (type) {
      case 'programmer':
        return Programmer();
      case 'hr':
        return HRManager();
      case 'boss':
        return Boss();
      default:
        return Programmer();
    }
  }
}
//USE CASE 1 METHOD

Employee employee = Employee(EmployeeType.hr);
//employee.work();

//USE CASE 2 METHOD

Employee employees = FactoryMethod.getEmployee("type");
//employee.work();

//
//FLUTTER EXAMPLE
//

abstract class PlatformButton {
  Widget build(VoidCallback onPressed, Widget child);

  factory PlatformButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidButton();
      case TargetPlatform.iOS:
        return IOSButton();
      default:
        return AndroidButton();
    }
  }
}

class AndroidButton implements PlatformButton {
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

class IOSButton implements PlatformButton {
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: child,
    );
  }
}

// Theme.of(context).Platform;
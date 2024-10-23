import 'package:flutter/material.dart';
import 'package:get/get.dart';

loading1() {
  return SizedBox(
    width: Get.width,
    height: Get.height,
    child: Center(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: SweepGradient(
            colors: [
              Colors.blue.shade200,
              Colors.purple.shade200,
              Colors.blue.shade200,
            ],
            stops: const [0.3, 0.6, 1],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              blurRadius: 8.0,
              spreadRadius: 4.0,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: CircularProgressIndicator(
            strokeWidth: 5,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

Chip buildChip(String title, String count) {
  return Chip(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(color: Colors.transparent),
    ),
    backgroundColor: Colors.white,
    shadowColor: Colors.black,
    label: Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0), // Adjust padding to make space for the circular container
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              SizedBox(width: 8.0), // Replace with a fixed width for spacing
            ],
          ),
        ),
        Positioned(
         top:-26,right:-20, // Position the container to overlap the chip boundary
          child: Container(
            padding: const EdgeInsets.all(8.0), // Adjust padding as necessary
            decoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: Text(
              count,
              style: TextStyle(
                color: Colors.white, // Ensure text is readable
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

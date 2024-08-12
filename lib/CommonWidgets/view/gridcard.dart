// import 'package:flutter/material.dart';
//
// import '../../utils/helper/styles.dart';
//
// Card buildCard(title,content,subcontent,style) {
//   return Card(
//     surfaceTintColor: Colors.white,
//     elevation: 2.0, // Add a slight shadow for depth
//     shape: RoundedRectangleBorder(
//         borderRadius:
//         BorderRadius.circular(10.0)), // Rounded corners
//     child:
//   );
// }

import 'package:flutter/material.dart';

import '../../utils/helper/styles.dart';

Card buildCard({
  required String title,
  required String content,
  required String subcontent,
  TextStyle? style, // Nullable to allow default usage
}) {
  return Card(
    surfaceTintColor: Colors.white,
    elevation: 2.0, // Add a slight shadow for depth
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ), // Rounded corners
    child: Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Container(
        // Wrap the column in a Container for full width
        padding: EdgeInsets.all(
            16.0), // Add some padding for aesthetics
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              content,
              style: style, // Adjust font size as needed
            ),
            SizedBox(
                height:
                10.0), // Use a fixed height for spacing
            Text(
              subcontent,
              style: Text7, // Adjust font size as needed
            ),
            SizedBox(
                height:
                10.0), // Use a fixed height for spacing
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold), // Adjust font size and weight
            ),
          ],
        ),
      ),
    ),
  );
}

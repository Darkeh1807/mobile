import 'package:bus_booking/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomUplaoder extends StatelessWidget {
  final String title;
  const CustomUplaoder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.08,
      width: screenSize.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border.fromBorderSide(BorderSide(width: 0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.document_upload,
            ),
            addHorizontalSpace(10),
            Flexible(
                child: Text(
              title,
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ),
      ),
    );
  }
}

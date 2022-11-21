import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "MAKE YOUR DAY",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: Theme.of(context).colorScheme.tertiary,
              height: 50,
              width: 50,
              child: const Icon(
                Icons.add,
                size: 35,
              ),
            ),
          )
        ],
      ),
    );
  }
}

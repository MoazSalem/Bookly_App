import 'package:flutter/material.dart';

class DoubleButtons extends StatelessWidget {
  final String previewUrl;
  const DoubleButtons({Key? key, required this.previewUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 38.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
                ),
              ),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.26,
                height: MediaQuery.sizeOf(context).width * 0.12,
                child: const Center(
                  child: Text(
                    "Free",
                    style:
                        TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              )),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffef8262),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
                ),
              ),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.26,
                height: MediaQuery.sizeOf(context).width * 0.12,
                child: const Center(
                  child: Text(
                    "Free Preview",
                    style:
                        TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

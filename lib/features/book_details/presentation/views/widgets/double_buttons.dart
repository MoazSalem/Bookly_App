import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoubleButtons extends StatelessWidget {
  final BookModel book;
  const DoubleButtons({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 38.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => _launchUrl(Uri.parse(book.volumeInfo?.canonicalVolumeLink ?? "")),
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
                child: Center(
                  child: Text(
                    book.saleInfo?.listPrice != null
                        ? "${book.saleInfo!.listPrice!.amount} ${book.saleInfo!.listPrice!.currencyCode}"
                        : "Free",
                    style:
                        const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              )),
          ElevatedButton(
              onPressed: () => _launchUrl(Uri.parse(book.volumeInfo?.previewLink ?? "")),
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

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

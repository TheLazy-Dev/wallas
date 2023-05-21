import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DownloadDialog extends StatelessWidget {
  const DownloadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text("Download Complete")),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.network(
            "https://assets5.lottiefiles.com/packages/lf20_hdmkzp2n.json",
            repeat: false,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 30,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff5fced6)),
              child: const Center(
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

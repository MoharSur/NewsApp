import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsViewer extends StatefulWidget {
  @override
  _NewsViewerState createState() => _NewsViewerState();
}

class _NewsViewerState extends State<NewsViewer> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map;
    var url = args['url'];
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purple, Colors.red],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft))),
        actions: [
          IconButton(
              onPressed: () async {
                if (await controller.canGoBack()) {
                  await controller.goBack();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cannot go backward')));
                }
              },
              icon: const Icon(Icons.arrow_back_ios)),
          const SizedBox(width: 16.0),
          IconButton(
              onPressed: () async {
                if (await controller.canGoForward()) {
                  await controller.goForward();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cannot go forward')));
                }
              },
              icon: const Icon(Icons.arrow_forward_ios)),
          const SizedBox(width: 16.0),

        ],
      ),
      body: Card(
        child: Container(
          margin: const EdgeInsets.all(3.0),
          child: WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (_controller) {
                controller = _controller;
              }),
        ),
      ),
    );
  }
}

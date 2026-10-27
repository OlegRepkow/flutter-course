import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewArticleScreen extends StatefulWidget {
  const WebViewArticleScreen({required this.url, super.key});

  final String url;

  @override
  State<WebViewArticleScreen> createState() => _WebViewArticleScreenState();
}

class _WebViewArticleScreenState extends State<WebViewArticleScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}

// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage(
      {super.key,
      required this.html,
      required this.title,
      this.uri = true,
      this.paymentMethodPage = false});

  final String html;
  final String title;
  final bool uri;
  final bool paymentMethodPage;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..enableZoom(true)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            if (url.contains('deep_link_id')) {
              launch(url);
            }
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (Platform.isAndroid) {
              if (!request.url.contains('intent://') &&
                  request.url.contains('pay-result')) {
                launch(request.url);
              }
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.uri
          ? Uri.dataFromString(widget.html, mimeType: 'text/html').toString()
          : widget.html));
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
          ),
          leading: IconButton(
            padding: const EdgeInsets.only(left: 20),
            icon: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.arrow_back_ios)),
            onPressed: () async {
              Get.back();
            },
          ),
        ),
        body: WebViewWidget(
          controller: controller,
        ));
  }
}

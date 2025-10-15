

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// For iOS webview
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import '../../../../core/utils/app_colors.dart';

class ContentPageScreen extends StatefulWidget {
  final String title;
  final String htmlContent;

  const ContentPageScreen(
      {super.key, required this.htmlContent, required this.title});

  @override
  State<ContentPageScreen> createState() => _contentPageScreenState();
}

class _contentPageScreenState extends State<ContentPageScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    //platform initialization
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
          allowsInlineMediaPlayback: true,
          mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{});
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }
    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    // setup controller
    _controller = controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {},
        onPageStarted: (url) {},
        onWebResourceError: (error) {},
      ))
      ..loadHtmlString(_getFormattedHtml());
  }

  String _getFormattedHtml() {
    return '''
      <!DOCTYPE html>
      <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body {
            font-family: -apple-system, BlinkMacSystemFont, sans-serif;
            padding: 20px;
            color: #333;
            line-height: 1.6;
            table{width: 100% !important}
          }
          .text-primary {
            color: #007AFF;
          }
        </style>
      </head>
      <body>
        ${widget.htmlContent}
      </body>
      </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

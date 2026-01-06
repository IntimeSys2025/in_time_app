import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// For iOS webview
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import '../../../../core/utils/app_colors.dart';

class ContentPageScreen extends StatefulWidget {
  final String title;
  final String htmlContent;
  final String inTimeHtmlContent;

  const ContentPageScreen(
      {super.key, required this.htmlContent, required this.title, required this.inTimeHtmlContent});

  @override
  State<ContentPageScreen> createState() => _contentPageScreenState();
}

class _contentPageScreenState extends State<ContentPageScreen> {
  late final WebViewController _tenantController;
  late final WebViewController _inTimeController;


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
    final WebViewController controller2 =
    WebViewController.fromPlatformCreationParams(params);

    // setup controller
    _tenantController = controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {},
        onPageStarted: (url) {},
        onWebResourceError: (error) {},
      ))
      ..loadHtmlString(_getFormattedHtml(htmlContent: widget.htmlContent));
    // setup controller
    _inTimeController = controller2
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {},
        onPageStarted: (url) {},
        onWebResourceError: (error) {},
      ))
      ..loadHtmlString(_getFormattedHtml(htmlContent: widget.inTimeHtmlContent));
  }

  String _getFormattedHtml({required String htmlContent}) {
    return '''
      <!DOCTYPE html>
      <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <style>
          body {
            font-family: -apple-system, BlinkMacSystemFont, sans-serif;
            padding: 20px;
            color: #333;
            
          }
          .text-primary {
            color: #007AFF;
            overflow-x: auto;
          }
        </style>
      </head>
      <body>
        $htmlContent
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
      // body: WebViewWidget(controller: _controller),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              onExpansionChanged: (value) {},
              title:  Text('Tenant ${widget.title}'),
              trailing: const RotationTransition(
                turns: AlwaysStoppedAnimation(0.5),
                child: Icon(Icons.keyboard_arrow_up, size: 24),
              ),
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: WebViewWidget(controller: _tenantController))
              ],
            ),
            ExpansionTile(
              onExpansionChanged: (value) {},
              title:  Text('InTime ${widget.title}'),
              trailing: const RotationTransition(
                turns: AlwaysStoppedAnimation(0.5),
                child: Icon(Icons.keyboard_arrow_up, size: 24),
              ),
              children: [
                SizedBox(
                    height: 500, child: WebViewWidget(controller: _inTimeController))
              ],
            ),

            // ListTile(
            //   title: const Text('Tenant Terms & Conditions'),
            //   trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            //   onTap: () {
            //     showModalBottomSheet(
            //       isScrollControlled: true,
            //       context: context,
            //       builder: (context) {
            //         return ContentPageBottomSheet(
            //             contentPageWidget: WebViewWidget(controller: _controller),
            //             title: 'Tenant Terms & Conditions');
            //       },
            //     );
            //   },
            // ),
            // ListTile(
            //   title: const Text('InTime Terms & Conditions'),
            //   trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            //   onTap: () {
            //     showModalBottomSheet(
            //       context: context,
            //       builder: (context) {
            //         return ContentPageBottomSheet(
            //             contentPageWidget: WebViewWidget(controller: _controller),
            //             title: 'InTime Terms & Conditions');
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

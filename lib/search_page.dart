import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class SearchPage extends StatelessWidget {
  WebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: WebView(
        initialUrl: 'https://bradjjc.github.io/wep-test/post.html',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
        javascriptChannels: {
          _toasterJavascriptChannel(context),
        },

      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Text('loadUrl'),
            onPressed: () {
              _webViewController.loadUrl('https://survivalcoding.com');
            },
          ),
              // _webViewController.canGoBack().then((value) {
              //   if (value) {
              //     _webViewController.goBack();
              //   }
              // });
        ],
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'messageHandler',
        onMessageReceived: (JavascriptMessage message) {
          Navigator.pop(context, message.message);
          print(message.message);
        });
  }
}

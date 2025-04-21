import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatelessWidget {
  final String url;

  const DetailPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('상세 정보')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(url)),
        initialSettings: InAppWebViewSettings(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false,
          javaScriptEnabled: true,
          javaScriptCanOpenWindowsAutomatically: true,
          userAgent:
              "Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36",
          domStorageEnabled: true,
          databaseEnabled: true,
          clearCache: true,
          useOnLoadResource: true,
        ),
        onLoadStop: (controller, url) {
          // 페이지 로딩이 완료되면 호출됩니다
          print("페이지 로드 완료: $url");
        },
        onLoadError: (controller, url, code, message) {
          // 에러가 발생하면 호출됩니다
          print("페이지 로드 오류: $code, $message");
        },
      ),
    );
  }
}

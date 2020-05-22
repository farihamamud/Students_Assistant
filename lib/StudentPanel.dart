import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students_assistant/Config.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import "package:url_launcher/url_launcher.dart";
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(MaterialApp(
    home: StudentPanel(),
  ));
}
class StudentPanel extends StatefulWidget {
  @override
  _StudentPanelState createState() => _StudentPanelState();
}
_launchURL() async {
  const url = 'http://202.5.52.152:8081/';
  if (await canLaunch(url)) {
    await launch(url,forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
class _StudentPanelState extends State<StudentPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Config.appbar_color,
          title: Center(
            child: Text("Student Panel"),
          ),
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'http://202.5.52.152:8081/',
          navigationDelegate: (NavigationRequest request) {
            if(request.url.contains("intent:")) {
              _launchURL();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        )
    );
  }
}

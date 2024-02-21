import 'package:flutter/material.dart';

class UIManage {
  Widget newManage({
    required Widget body,
    required BuildContext context,
    String label = "App",
    bool showAppBarOnDesktop = true,
    var sidebar,
    var bottomNavigationBar,
    var floatingActionButton
  }){
    AppBar appBar = AppBar(
      title: Text(label),
    );
    return Scaffold(
      appBar: MediaQuery.of(context).size.width < 400 ? appBar : showAppBarOnDesktop ? appBar : null,
      body: MediaQuery.of(context).size.width < 400 ? body : Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sidebar ?? const SizedBox(),
          const SizedBox(width: 50,),
          body
        ],
      ),
      drawer: MediaQuery.of(context).size.width < 400 ? sidebar : null,
      floatingActionButton: floatingActionButton ?? const SizedBox(),
      bottomNavigationBar: bottomNavigationBar ?? const SizedBox(),
    );
  }
}
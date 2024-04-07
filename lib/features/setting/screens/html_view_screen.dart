import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:Sanaa/util/color_resources.dart';
import 'package:Sanaa/util/dimensions.dart';
import 'package:Sanaa/common/widgets/custom_app_bar_widget.dart';

class HtmlViewScreen extends StatelessWidget {
  final String title;
  final String? url;
  const HtmlViewScreen({Key? key, required this.url, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getBackgroundColor(),
      appBar: CustomAppbarWidget(title: title),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Column(
          children: [
            Html(
              data: url ?? '',
            ),
          ],
        ),
      ),
    );
  }
}

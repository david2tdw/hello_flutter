import 'package:flutter/material.dart';
import 'package:hello_flutter/deer/util/image_utils.dart';



/// 加载本地资源图片
class LoadAssetImage extends StatelessWidget {
  const LoadAssetImage(this.image, {
    Key key,
    this.width,
    this.height,
    this.fit,
    this.format: 'png',
    this.color
  }): super(key: key);

  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final String format;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageUtils.getImgPath(image, format: format),
      height: height,
      width: width,
      fit: fit,
      color: color,
      // 忽略图片语义
      excludeFromSemantics: true,
    );
  }
}
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:common_utils/common_utils.dart';
// import 'package:flukit/flukit.dart';
// import 'package:flutter/material.dart';
// import 'package:hello_flutter/model/models.dart';
// import 'package:hello_flutter/ui/widgets/article_item.dart';
// import 'package:hello_flutter/ui/widgets/header_item.dart';
// import 'package:hello_flutter/ui/widgets/progress_view.dart';

// bool isHomeInit = true;

// class HomePage extends StatelessWidget {
//   final String labelId;

//   const HomePage({Key key, this.labelId}) : super(key: key);

//   Widget buildBanner(BuildContext context, List<BannerModel> list) {
//     if (ObjectUtil.isEmpty(list)) {
//       return Container(
//         height: 0.0,
//       );
//     }
//     return AspectRatio(
//       aspectRatio: 16.0 / 9.0,
//       child: Swiper(
//         indicatorAlignment: AlignmentDirectional.topEnd,
//         circular: true,
//         interval: const Duration(seconds: 5),
//         indicator: NumberSwiperIndicator(),
//         children: list.map((model) {
//           return InkWell(
//             onTap: () {
//               LogUtil.e("BannerModel: " + model.toString());
//             },
//             child: CachedNetworkImage(
//               fit: BoxFit.fill,
//               imageUrl: model.imagePath,
//               placeholder: (context, url) => ProgressView(),
//               errorWidget: (context, url, error) => Icon(Icons.error),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget buildWxArticle(BuildContext context, List<ReposModel> list) {
//     if (ObjectUtil.isEmpty(list)) {
//       return new Container(
//         height: 0.0,
//       );
//     }
//     List<Widget> _children = list.map((model) {
//       return ArticleItem(
//         model,
//         isHome: true,
//       );
//     }).toList();

//     List<Widget> children = new List();
//     children.add(HeaderItem(
//       titleColor: Colors.green,
//       leftIcon: Icons.library_books,
//       titleId: 'rec_wxarticle',
//       onTap: () {},
//     ));

//     children.addAll(_children);

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: children,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     LogUtil.e("HomePage build......");
//     return Container();
//   }
// }

// class NumberSwiperIndicator extends SwiperIndicator {
//   @override
//   Widget build(BuildContext context, int index, int itemCount) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.black45,
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       margin: EdgeInsets.only(top: 10.0, right: 5.0),
//       padding: EdgeInsets.symmetric(
//         horizontal: 6.0,
//         vertical: 2.0,
//       ),
//       child: Text(
//         "${++index}/$itemCount",
//         style: TextStyle(
//           color: Colors.white70,
//           fontSize: 11.0,
//         ),
//       ),
//     );
//   }
// }

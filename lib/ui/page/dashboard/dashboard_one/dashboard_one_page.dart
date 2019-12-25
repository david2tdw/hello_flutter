import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_flutter/ui/page/dashboard/dashboard_one/dashboard_menu_row_one.dart';
import 'package:hello_flutter/ui/widgets/login_background.dart';
import 'package:hello_flutter/ui/widgets/profile_tile.dart';
import 'package:hello_flutter/utils/uidata.dart';

class DashboardOnePage extends StatelessWidget {
  Size deviceSize;
  Widget appBarColumn(BuildContext context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 18.0
      ),
      child: new Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new IconButton(
                icon: Icon(
                  defaultTargetPlatform == TargetPlatform.android? Icons.arrow_back : Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.canPop(context) ? Navigator.pop(context) : null,
              ),
              new ProfileTile(
                title: "Hi, tdw",
                subtitle: "Welcome to the flutter",
                textColor: Colors.white,
              ),
              new IconButton(
                icon: new Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {
                  print("press");
                },
              )
            ],
          ),
        ],
      ),
    ),
  );

  Widget searchCard() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.search),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Find product."
                ),
              ),
            ),
            Icon(Icons.menu),
          ],
        ),
      ),
    ),
  );

  Widget actionMenuCard() => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 8.0
    ),
    child: Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              DashboardMenuRowOne(
                firstIcon: FontAwesomeIcons.solidUser,
                firstLabel: "Friends",
                firstIconCircleColor: Colors.blue,
                secondIcon: FontAwesomeIcons.userFriends,
                secondLabel: "Groups",
                secondIconCircleColor: Colors.orange,
                thirdIcon: FontAwesomeIcons.mapMarkerAlt,
                thirdLabel: "Nearby",
                thirdIconCircleColor: Colors.purple,
                fourthIcon: FontAwesomeIcons.locationArrow,
                fourthLabel: "Moment",
                fourthIconCircleColor: Colors.indigo,
              ),
              DashboardMenuRowOne(
                    firstIcon: FontAwesomeIcons.images,
                    firstLabel: "Albums",
                    firstIconCircleColor: Colors.red,
                    secondIcon: FontAwesomeIcons.solidHeart,
                    secondLabel: "Likes",
                    secondIconCircleColor: Colors.teal,
                    thirdIcon: FontAwesomeIcons.solidNewspaper,
                    thirdLabel: "Articles",
                    thirdIconCircleColor: Colors.lime,
                    fourthIcon: FontAwesomeIcons.solidCommentDots,
                    fourthLabel: "Reviews",
                    fourthIconCircleColor: Colors.amber,
                  ),
                  DashboardMenuRowOne(
                    firstIcon: FontAwesomeIcons.footballBall,
                    firstLabel: "Sports",
                    firstIconCircleColor: Colors.cyan,
                    secondIcon: FontAwesomeIcons.solidStar,
                    secondLabel: "Fav",
                    secondIconCircleColor: Colors.redAccent,
                    thirdIcon: FontAwesomeIcons.blogger,
                    thirdLabel: "Blogs",
                    thirdIconCircleColor: Colors.pink,
                    fourthIcon: FontAwesomeIcons.wallet,
                    fourthLabel: "Wallet",
                    fourthIconCircleColor: Colors.brown,
                  ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget balanceCard() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Balance",
                  style: TextStyle(
                    fontFamily: UIData.ralewayFont
                  ),
                ),
                Material(
                  color: Colors.black,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "500 Points",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: UIData.ralewayFont
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "₹ 1000",
              style: TextStyle(
                fontFamily: UIData.ralewayFont,
                fontWeight: FontWeight.w700,
                color: Colors.green,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
    ),
  );


  Widget allCards(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: <Widget>[
        appBarColumn(context),
        SizedBox(
          height: deviceSize.height * 0.01,
        ),
        searchCard(),
        SizedBox(
          height: deviceSize.height * 0.01,
        ),
        actionMenuCard(),
        SizedBox(
          height: deviceSize.height * 0.01,
        ),
        balanceCard(),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          LoginBackground(
            showIcon: false,
          ),
          allCards(context),
        ],
      ),
    );
  }
}
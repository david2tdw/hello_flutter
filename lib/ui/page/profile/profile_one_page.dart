import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/widgets/common_divider.dart';
import 'package:hello_flutter/ui/widgets/common_scafflold.dart';
import 'package:hello_flutter/ui/widgets/profile_tile.dart';
import 'package:hello_flutter/utils/uidata.dart';

class ProfileOnePage extends StatelessWidget {
  var deviceSize;

  //Column1
  Widget profileColumn() => Container(
        height: deviceSize.height * 0.24,
        child: FittedBox(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTile(
                  title: "tdw",
                  subtitle: "coder",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.chat),
                        color: Colors.black,
                        onPressed: () {},
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(40.0)),
                          border: new Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(UIData.pkImage),
                          foregroundColor: Colors.black,
                          radius: 30.0,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.call),
                        color: Colors.black,
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  //column3
  Widget descColumn() => Container(
        height: deviceSize.height * 0.13,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              "Google Developer Expert for Flutter.",
              style: TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
              maxLines: 3,
              softWrap: true,
            ),
          ),
        ),
      );

  // column4
  Widget accountColumn() => FittedBox(
        fit: BoxFit.fill,
        child: Container(
          height: deviceSize.height * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ProfileTile(
                      title: "Website",
                      subtitle: "subtitlesubtitle",
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ProfileTile(
                      title: "Phone",
                      subtitle: "1235455",
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ProfileTile(
                      title: "YouTube",
                      subtitle: "YouTubeYouTube",
                    )
                  ],
                ),
              ),
              FittedBox(
                fit: BoxFit.cover,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ProfileTile(
                      title: "Location",
                      subtitle: "New Delhi",
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ProfileTile(
                      title: "Email",
                      subtitle: "aa@sina.com",
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ProfileTile(
                      title: "Facebook",
                      subtitle: "fb.com/imt",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget bodyData() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          profileColumn(),
          CommonDivider(),
          followColumn(deviceSize),
          CommonDivider(),
          descColumn(),
          CommonDivider(),
          accountColumn(),
        ],
      ),
    );
  }

  Widget _scaffold() => CommonScaffold(
        appTitle: "View Profile",
        bodyData: bodyData(),
        showFAB: true,
        showDrawer: true,
        floatingIcon: Icons.person_add,
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return _scaffold();
  }
}

Widget followColumn(Size deviceSize) => Container(
      height: deviceSize.height * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ProfileTile(
            title: "1.5k",
            subtitle: "Posts",
          ),
          ProfileTile(
            title: "2.5K",
            subtitle: "Followers",
          ),
          ProfileTile(
            title: "10K",
            subtitle: "Comments",
          ),
          ProfileTile(
            title: "1.2k",
            subtitle: "Following",
          ),
        ],
      ),
    );

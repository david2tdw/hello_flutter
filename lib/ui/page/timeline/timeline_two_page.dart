import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_flutter/logic/bloc/post_bloc.dart';
import 'package:hello_flutter/model/post.dart';
import 'package:hello_flutter/ui/widgets/common_drawer.dart';
import 'package:hello_flutter/utils/uidata.dart';

class TimelineTwoPage extends StatefulWidget {
  @override
  _TimelineTwoPageState createState() => _TimelineTwoPageState();
}

class _TimelineTwoPageState extends State<TimelineTwoPage> {
  ScrollController scrollController;
  PostBloc postBloc;

  Widget bodyData () {
    return StreamBuilder<List<Post>>(
      stream: postBloc.postItems,
      builder: (context, snapshot) {
        return snapshot.hasData ? bodyList(snapshot.data) : Center(child: CircularProgressIndicator(),);
      },
    );
  }

  Widget bodyList(List<Post> posts) => ListView.builder(
    controller: scrollController,
    itemCount: posts.length,
    itemBuilder: (context, i) {
      Post post = posts[i];
      return Card(
        color: Colors.grey.shade900,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                  post.personImage,
                ),
              ),
              rightColumn(post),
            ],
          ),
        ),
      );
    },
  );

  Widget actionRow(Post post) => Padding(
    padding:  const EdgeInsets.only(right: 50.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.comment,
          size: 15.0,
          color: Colors.grey,
        ),
        Icon(
          FontAwesomeIcons.retweet,
          size: 15.0,
          color: Colors.grey,
        ),
        Icon(
          FontAwesomeIcons.heart,
          size: 15.0,
          color: Colors.grey,
        ),
        Icon(
          FontAwesomeIcons.share,
          size: 15.0,
          color: Colors.grey,
        )
      ],
    ),
  );

  Widget rightColumn(Post post) => Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              maxLines: 1,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${post.personName}"
                  ),
                  TextSpan(
                    text: "@${post.address}.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: "${post.postTime}",
                    style: TextStyle(color: Colors.grey)
                  )
                ]
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.message,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontFamily: UIData.quickFont,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          post.messageImage != null ?
          Material(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              post.messageImage,
              gaplessPlayback: true,
              fit: BoxFit.cover,
            ),
          ): Container(),
          SizedBox(
            height: 20.0,
          ),
          actionRow(post)
        ],
      ),
    ),
  );


  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    postBloc = PostBloc();
    scrollController.addListener((){
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        postBloc.fabSink.add(false);
      }
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        postBloc.fabSink.add(true);
      }
    });
  }

  @override
  void dispose() {
    postBloc?.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        centerTitle: false,
        title: Text("Tweet"),
      ),
      body: bodyData(),
      drawer: CommonDrawer(),
      floatingActionButton: StreamBuilder<bool>(
        stream: postBloc.fabVisible,
        initialData: true,
        builder: (context, snapshot) => AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: snapshot.data? 1.0 : 0.0,
          child: FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.white,
            child: CustomPaint(
              child: Container(),
              foregroundPainter: FloatingPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class FloatingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint amberPaint = Paint()
    ..color = Colors.amber
    ..strokeWidth = 5;

    Paint greenPaint = Paint()
    ..color = Colors.green
    ..strokeWidth = 5;

    Paint bluePaint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 5;

    Paint redPaint = Paint()
    ..color = Colors.red
    ..strokeWidth = 5;

    canvas.drawLine(Offset(size.width * 0.27, size.height * 0.5), Offset(size.width * 0.5, size.height * 0.5), amberPaint);
    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.5), Offset(size.width * 0.5, size.height - (size.height * 0.27)), greenPaint);
    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.5), Offset(size.width - (size.width * 0.27), size.height * 0.5), bluePaint);
    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.5), Offset(size.width * 0.5, size.height * 0.27), redPaint);

  }

  @override
  bool shouldRepaint(FloatingPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(FloatingPainter oldDelegate) => false;
}
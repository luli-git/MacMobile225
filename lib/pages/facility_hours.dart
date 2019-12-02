import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HoursTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: MyHomePage(title: "firebase"),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  @override

  
  Widget build(BuildContext context) {
    return new Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: Color(0xFF501426A).withOpacity(0.9),
            
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text("Facility Hours",
                    style: TextStyle(
                        color: Colors.blue[50],
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal)),
                background: Image.asset(
                  "assets/images/jwalblue.jpg",
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: ListPage(),
    ));
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

Future _data;

class _ListPageState extends State<ListPage> {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('facilities').getDocuments();
    return qn.documents;
  }

  // navigateToDetail(DocumentSnapshot post) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => DetailPage(
  //                 post: post,
  //               )));
  // }

  Future _data;
  @override
  void initState() {
    super.initState();
    _data = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: _data,
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return showLoad();
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return _expansionTile(snapshot.data[index].data);
                      // ListTile(
                      //   title: Text(snapshot.data[index].data['name']),
                      //   onTap: () => navigateToDetail(snapshot.data[index]),
                      // );
                    });
              }
            }));
  }

  Widget showLoad() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new CircularProgressIndicator(),
              width: 60.0,
              height: 60.0,
              alignment: Alignment.center,
            )
          ],
        )
      ],
    );
  }

  Widget _expansionTile(Map values) {
    return ExpansionTile(
      initiallyExpanded: false,
      title: Column(
        children: <Widget>[_listTile(values)],
      ),
      children: <Widget>[
        Padding(padding: const EdgeInsets.only(
              left: 25.0, top: 5.0, bottom: 5.0, right: 0.0),
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Website: " + values['link'],
                      softWrap: true,
                    ),
                    height: 30.0,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5.0)),
                  
                  Container(
                    child: Text("Location: " + values['location']),
                    height: 30.0,
                  )
                ],
              ),
            )
          ],
        ),)
      ], 
    );
  }

  Widget _listTile(Map values) {
    return InkWell(
      // onTap: all[index].urlTap,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 0.0, top: 10.0, bottom: 10.0, right: 0.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 80.0,
                width: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/" + values['image']),
                      fit: BoxFit.fill,
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          15.0), // horizontal distance between image and text
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(values['name'],
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Lora',
                              color: Colors.black87)),
                      const Padding(padding: EdgeInsets.only(top: 8.0)),
                      Text(values['phone'],
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black87)),
                      const Padding(padding: EdgeInsets.only(top: 8.0)),
                      Text(values['mToTR'],
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey[600])),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class DetailPage extends StatefulWidget {
//   final DocumentSnapshot post;
//   DetailPage({this.post});

//   @override
//   _DetailPageState createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("haha"),
//         ),
//         body: Container(
//             child: Card(
//                 child: ListTile(
//           title: Text(widget.post.data['link']),
//           subtitle: Text(
//             widget.post.data['phone'],
//           ),
//         ))));
//   }
// }

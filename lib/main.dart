import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppPageState createState() => new _MyAppPageState();
}

class _MyAppPageState extends State<MyApp> {
  var contact = [
    {
      'user': 'Chan Saw Lin',
      'phone': '0152131113',
      'check-in': '2020-06-30 16:10:05'
    },
    {
      'user': 'Lee Saw Loy',
      'phone': '0161231346',
      'check-in': '2020-07-11 15:39:59'
    },
    {
      'user': 'Khaw Tong Lin',
      'phone': '0158398109',
      'check-in': '2020-08-19 11:10:18'
    },
    {
      'user': 'Lim Kok Lin',
      'phone': '0168279101',
      'check-in': '2020-08-19 11:11:35'
    },
    {
      'user': 'Low Jun Wei',
      'phone': '0112731912',
      'check-in': '2020-08-15 13:00:05'
    },
    {
      'user': 'Yong Weng Kai',
      'phone': '0172332743',
      'check-in': '2020-07-31 18:10:11'
    },
    {
      'user': 'Jayden Lee',
      'phone': '0191236439',
      'check-in': '2020-08-22 08:10:38'
    },
    {
      'user': 'Kong Kah Yan',
      'phone': '0111931233',
      'check-in': '2020-07-11 12:00:00'
    },
    {
      'user': 'Jasmine Lau',
      'phone': '0162879190',
      'check-in': '2020-08-01 12:10:05'
    },
    {
      'user': 'Chan Saw Lin',
      'phone': '016783239',
      'check-in': '2020-08-23 11:59:05'
    }
  ];

  var contacts = [];
  String message = "";
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    contacts.addAll(contact);
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "You have reached end of the list";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Contact List'),
            ),
            body: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50.0,
                    color: Colors.white,
                    child: Center(
                      child: Text(message),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          controller: _controller,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            return new Card(
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.white70, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: new Container(
                                  margin: EdgeInsets.all(9.0),
                                  padding: EdgeInsets.all(6.0),
                                  child: new Row(children: <Widget>[
                                    new CircleAvatar(
                                      child: new Text(
                                          '${contacts[index]['user'][0]}'),
                                      backgroundColor: Color(0xff00695c),
                                      foregroundColor: Colors.white,
                                    ),
                                    new Padding(padding: EdgeInsets.all(8.0)),
                                    new Text(
                                      '${contacts[index]['user']}',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    new Padding(padding: EdgeInsets.all(8.0)),
                                    new Text(
                                      '${contacts[index]['check-in']}',
                                      style: TextStyle(fontSize: 13.0),
                                    )
                                  ]),
                                ));
                          }))
                ],
              ),
            )));
  }
}

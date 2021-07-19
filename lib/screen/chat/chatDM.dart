import 'package:flutter/material.dart';

class DM extends StatefulWidget {
  const DM({Key? key}) : super(key: key);

  @override
  _DMState createState() => _DMState();
}

class _DMState extends State<DM> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CHAT',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: 20,
          ),
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () => {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(

                  width: 10,
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: size.width - 30,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                        )),
                    cursorColor: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Rick',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('50m ago'),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/posts/rick.jpg'),
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'john',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('55m ago'),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/posts/john.jpg'),
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Jensen',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('2hr ago'),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/posts/jensen.jpg'),
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Rock',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('3hr ago'),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/posts/Rock.jpeg'),
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'joy',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('4hr ago'),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/posts/rick.jpg'),
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

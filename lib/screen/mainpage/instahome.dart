import 'package:flutter/material.dart';
//import 'package:instagram_clone/plussign/plus.dart';
//import 'package:instagram_clone/screen/chat/chatDM.dart';
import 'package:instagram_clone/screen/mainpage/instabody.dart';
import 'package:instagram_clone/screen/profile/profilescreen.dart';
import 'package:instagram_clone/screen/search/search.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/firebase/upload.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class InstaHome extends StatefulWidget {
  const InstaHome(
      {Key? key,
      required this.username,
      required this.bio,
      required this.phno,
      required this.defaultpage,
      required this.uid})
      : super(key: key);
  final String username, bio, phno, uid;
  final int defaultpage;
  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  final picker = ImagePicker();
  var active = "Home";
  FirebaseAuth fauth = FirebaseAuth.instance;
  late String? _photoURL;
  late int index;
  FileUpload fup = new FileUpload();
  FirebaseAuth auth = FirebaseAuth.instance;
  late final String uid;
  late final User user;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser!;
    uid = user.uid;
    index = widget.defaultpage;
    _photoURL = fauth.currentUser!.photoURL;
  }

  bool isparentloading = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      InstaBody(widget.uid),
      Search(),
      ProfileScreen(
        username: widget.username,
        bio: widget.bio,
        phno: widget.phno,
      )
    ];
    return new Scaffold(
        body: screens[index],
        /*appBar: AppBar(
          backgroundColor: new Color(0xfff8faf8),
          centerTitle: true,
          elevation: 1.0,
          leading: new Icon(
            Icons.camera_alt_outlined,
            color: Colors.black,
          ),
          title: SizedBox(
              height: 35.0, child: Image.asset("assets/instagram_logo.png")),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: new IconButton(
                icon: active == 'Send'
                    ? Icon(
                        Icons.send,
                        color: Colors.black,
                        size: 30,
                      )
                    : Icon(
                        Icons.send_outlined,
                        size: 30,
                      ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DM()),
                  );
                  setState(() {
                    active = 'Send';
                  });
                },
              ),
            )
          ],
        ),*/
        //new body: new InstaBody(),
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 50.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: active == 'Home'
                      ? Icon(
                          Icons.home,
                          size: 30,
                        )
                      : Icon(
                          Icons.home_outlined,
                          size: 30,
                        ),
                  onPressed: () {
                    setState(() {
                      active = 'Home';
                    });
                  },
                ),
                new IconButton(
                    icon: active == 'Search'
                        ? Icon(
                            Icons.search,
                            size: 32,
                          )
                        : Icon(
                            Icons.search_outlined,
                            size: 30,
                          ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Search()),
                      );
                      setState(() {
                        active = 'Search';
                      });
                    }),
                new IconButton(
                    icon: active == 'Add'
                        ? Icon(
                            Icons.add_box,
                            size: 30,
                          )
                        : Icon(
                            Icons.add_box_outlined,
                            size: 30,
                          ),
                    onPressed: () {
                      setState(() {
                        active = 'Add';
                      });
                      addfile();
                    }),
                new IconButton(
                    icon: active == 'Love'
                        ? Icon(
                            Icons.favorite,
                            size: 30,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            size: 30,
                          ),
                    onPressed: () {
                      setState(() {
                        active = 'Love';
                      });
                    }),
                new InkWell(
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/posts/rick.jpg')),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen(
                                  username: widget.username,
                                  bio: widget.bio,
                                  phno: widget.phno,
                                )),
                      );
                    }),
              ],
            ),
          ),
        ));
  }

  Future<dynamic> addfile() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: IntrinsicWidth(
              child: IntrinsicHeight(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Capture with camera'),
                    onPressed: () async {
                      var pickedFile =
                          await picker.pickImage(source: ImageSource.camera);
                      if (pickedFile != null)
                        await getnamebio(pickedFile, 'upload');
                    },
                  ),
                  Divider(),
                  ElevatedButton(
                      child: const Text('Upload from device'),
                      onPressed: () async {
                        var pickedFile =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (pickedFile != null)
                          await getnamebio(pickedFile, 'upload');
                      }),
                ],
              )),
            ),
          ),
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  Future<dynamic> getnamebio(var pickedFile, String upload) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return isparentloading ? false : true;
            },
            child: AlertDialog(
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Caption'),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: bioController,
                        maxLines: 2,
                        maxLength: 25,
                        validator: (value) {
                          return value!.length != 0
                              ? null
                              : "Please Enter something";
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text("Post"),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            EasyLoading.show(
                              status: 'Processing...',
                            );
                            isparentloading = true;
                            await fup.uploadfromdevice(
                                widget.username,
                                user.photoURL!,
                                nameController.text.trim(),
                                bioController.text.trim(),
                                uid,
                                pickedFile);
                            isparentloading = false;
                            EasyLoading.showSuccess(
                                'Image uploaded successfully');
                            Navigator.pop(context);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

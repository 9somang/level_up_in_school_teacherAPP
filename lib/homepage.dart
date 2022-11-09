import 'package:admin/page/main_page.dart';
import 'package:admin/page/notice_page.dart';
import 'package:admin/page/quest_page.dart';
import 'package:admin/page/userinfo.dart';
import 'package:admin/user/Login.dart';
import 'package:admin/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        label: '학급확인',
        icon: Icon(Icons.home_filled)
    ),
    BottomNavigationBarItem(
        label: '퀘스트',
        icon: Icon(Icons.add_to_home_screen)
    ),
    BottomNavigationBarItem(
        label: '공지사항 등록',
        icon: Icon(Icons.add_alert_sharp)
    ),
  ];

  List pages = [
    Mainpage(),
    Questpage(),
    Noticepage()
  ];

  @override
  Widget build(BuildContext context) {
    UserController u = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: Text('${u.principal.value.username} 선생님의 슬기로운 교사생활 !'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/한양티비로고.png')
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black),
              title: Text('로그아웃'),
              onTap: () {
                _logoutDialog(context);
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person, color: Colors.black),
              title: Text('교사 정보확인'),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => UserInfo());
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        // bar의 배경색
        selectedItemColor: Colors.black,
        // 선택된 카테고리의 색상
        unselectedItemColor: Colors.grey.withOpacity(.60),
        // 선택 안된 카테고리의 색상
        selectedFontSize: 14,
        //선택된 카테고리의 폰트사이즈
        unselectedFontSize: 10,
        // 선택안된 카테고리의 폰트사이즈
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: bottomItems,
      ),
      body: pages[_selectedIndex],
    );
  }

  void _logoutDialog(BuildContext context) {
    UserController u = Get.find();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("로그아웃 하시겠습니까?"),
            content: SingleChildScrollView(
              child: ListBody(
                  children: const <Widget>[
                    Text('로그아웃 시 로그인 화면으로 이동합니다.')
                  ]
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text("예"),
                onPressed: () {
                  Navigator.of(context).pop();
                  u.logout();
                  Get.offAll(LoginPage());
                },
              ),
              ElevatedButton(
                child: const Text("아니요"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

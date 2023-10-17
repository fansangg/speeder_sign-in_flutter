import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final logic = Get.find<LoginLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        title: const Text(
          '登录',
          style: TextStyle(color: Color(0xffd8d8d8)),
        ),
        backgroundColor: const Color(0xff181818),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (logic.backCount == 0) {
            logic.backCount = 1;
            logic.confirmBack();
            Get.snackbar('warning', '再按一次退出', duration: const Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);
            return false;
          } else {
            return true;
          }
        },
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            accountTextField(),
            const SizedBox(
              height: 20,
            ),
            pswTextField(),
            const SizedBox(
              height: 40,
            ),
            loginBtn(),
          ],
        ),
      ),
    );
  }

  Widget accountTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withAlpha(180)),
      ),
      child: TextField(
        decoration: const InputDecoration(
          hintText: "请输入账号",
          hintStyle: TextStyle(color: Colors.white60),
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.white70),
        maxLines: 1,
        onChanged: (_) {
          logic.account = _;
        },
      ),
    );
  }

  Widget pswTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withAlpha(180)),
      ),
      child: TextField(
        decoration: const InputDecoration(
          hintText: "请输入密码",
          hintStyle: TextStyle(color: Colors.white60),
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
        ),
        obscureText: true,
        style: const TextStyle(color: Colors.white70),
        maxLines: 1,
        onChanged: (_) {
          logic.psw = _;
        },
      ),
    );
  }

  Widget loginBtn() {
    return GestureDetector(
      onTap: () {
        logic.login();
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.circular(16)),
        child: const Center(
          child: Text(
            "登录",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

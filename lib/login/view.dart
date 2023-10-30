import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final logic = Get.find<LoginLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          '登录',
          style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Theme.of(Get.context!).primaryColor,
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
    var accountController = TextEditingController(text: logic.account);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(Get.context!).primaryColorDark),
      ),
      child: TextField(
        controller: accountController,
        decoration: InputDecoration(
          hintText: "请输入账号",
          hintStyle: Theme.of(Get.context!).textTheme.titleMedium,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
        ),
        style: Theme.of(Get.context!).textTheme.bodyMedium,
        maxLines: 1,
        onChanged: (_) {
          logic.account = _;
        },
      ),
    );
  }

  Widget pswTextField() {
    var pswController = TextEditingController(text: logic.psw);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(Get.context!).primaryColorDark),
      ),
      child: TextField(
        controller: pswController,
        decoration: InputDecoration(
          hintText: "请输入密码",
          hintStyle: Theme.of(Get.context!).textTheme.titleMedium,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
        ),
        obscureText: true,
        style: Theme.of(Get.context!).textTheme.bodyMedium,
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
        decoration: BoxDecoration(color: Theme.of(Get.context!).primaryColorDark, borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            "登录",
            style: Theme.of(Get.context!).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

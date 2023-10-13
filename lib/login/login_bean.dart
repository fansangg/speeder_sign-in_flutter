/// ret : 1
/// msg : "登录成功"

class LoginBean {
  LoginBean({
    num? ret,
    String? msg,
  }) {
    _ret = ret;
    _msg = msg;
  }

  LoginBean.fromJson(dynamic json) {
    _ret = json['ret'];
    _msg = json['msg'];
  }

  num? _ret;
  String? _msg;

  LoginBean copyWith({
    num? ret,
    String? msg,
  }) =>
      LoginBean(
        ret: ret ?? _ret,
        msg: msg ?? _msg,
      );

  num? get ret => _ret;

  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ret'] = _ret;
    map['msg'] = _msg;
    return map;
  }
}

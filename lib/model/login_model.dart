class LoginModel {
  int? status;
  String? username;
  String? role;
  String? token;
  List<dynamic>? module;

  LoginModel({this.status, this.username, this.role, this.token, this.module});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    username = json['username'];
    role = json['role'];
    token = json['token'];
    if (json['module'] != null) {
      module = <dynamic>[];
      json['module'].forEach((v) {
        module!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['username'] = username;
    data['role'] = role;
    data['token'] = token;
    if (module != null) {
      data['module'] = module!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

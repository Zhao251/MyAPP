import 'package:flutter/material.dart';

import '../request/api_service.dart';
import 'index_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _nickname = "";
  String _password = "";
  String _phone = "";
  String _confirmUsername = "";
  String _confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册页面'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: '用户名'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return '请输入你的用户名';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _nickname = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '确认用户名'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return '请再次输入你的用户名';
                    }
                    if (value != _nickname) {
                      return '用户名不一致';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _confirmUsername = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '密码'),
                  obscureText: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return '请输入你的密码';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '确认密码'),
                  obscureText: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return '请再次输入你的密码';
                    }
                    if (value != _password) {
                      return '密码不一致';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _confirmPassword = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '手机号码'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return '请输入你的手机号码';
                    }
                    if (value?.length != 11) {
                      return '手机号码必须为11位';
                    }
                    // Add additional validation logic if needed
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phone = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        // TODO: Save registration data
                        final response = await _createUserRequest();
                        if (response != null) {
                          // 用户创建成功，可以在这里处理成功后的逻辑
                          // ...
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IndexPage()),
                          );
                        } else {
                          // 用户创建失败，可以在这里处理失败后的逻辑
                          // ...
                        }
                      }
                    },
                    child: Text('注册'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _createUserRequest() async {
    try {
      // 构建用户注册请求的数据
      final requestData = {
        'nickname': _nickname,
        'password': _password,
        'phone': _phone,
      };

      // 发送用户注册请求
      final response = await ApiService.getDioInstance().post(
        'http://192.168.8.1:9091/user/register',
        data: requestData,
      );

      // 输出日志，查看响应结果
      print('User Registration Response: $response');

      final jsonData = response.data;

      // 处理用户注册响应的逻辑，根据后端返回的数据进行判断
      // ...

      return jsonData;
    } catch (error) {
      // 处理请求错误
      print('User Registration Error: $error');

      // ...

      return null;
    }
  }
}

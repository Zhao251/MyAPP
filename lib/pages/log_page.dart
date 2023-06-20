import 'package:flutter/material.dart';
import 'package:train_order_system/pages/register_page.dart';

import 'index_page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('欢迎登录'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '登录账号',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '俺承诺保证您的账号及个人信息的安全，绝不提供给任何第三方，绑定即视为同意《免责与隐私申明》。',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '用户名',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入用户名';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '密码',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入密码';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        // 处理登录按钮点击事件
                        print('Username: $_username, Password: $_password');
                        // 清空表单
                        _formKey.currentState!.reset();
                        // 导航到IndexPage页面
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IndexPage()),
                        );
                      } else {
                        setState(() {
                          _autoValidate = true;
                        });
                      }
                    },
                    child: Text('登录'),
                  ),
                  SizedBox(width: 220), // 添加间距
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(), // 替换为目标页面的构造函数
                        ),
                      );
                    },
                    child: Text('注册'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

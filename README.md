# hello_flutter

A new Flutter project.

## Getting Started

```
flutter run
```


json_serializable使用：

```
flutter packages pub run build_runner build
```

redux 架构：
[MVC、MVP、BloC、Redux四种架构在Flutter上的尝试](https://juejin.im/post/5d2c4b76f265da1bb56529b5)

在 lib\data\config\  目录下添加ignoreConfig.dart文件
内容为：

```
class NetConfig {

  static const CLIENT_ID = "your client id";

  static const CLIENT_SECRET = "your secret";
}

```

[Flutter 实现根据环境加载不同配置](https://yuanxuxu.com/2018/09/13/flutter-load-config-by-env/)

运行无redux版本：
```
flutter run -t lib/main.dart
```

运行redux版本：
```
flutter run -t lib/main-redux.dart
```



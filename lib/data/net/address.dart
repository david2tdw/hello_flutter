class Address {
  static const String host = 'https://api.github.com/';

  static getAuthorization() {
    return "${host}authorizations";
  }

  static trending(since, languageType) {
    if (languageType != null) {
      return "https://github.com/trending/$languageType?since=$since";
    }
    return "https://github.com/trending?since=$since";
  }

  static trendingApi(since, languageType) {
    if (languageType != null) {
      return "https://guoshuyu.cn/github/trend/list?languageType=$languageType&since=${since}";
    }
    return "https://guoshuyu.cn/github/trend/list?since=$since";
  }
}

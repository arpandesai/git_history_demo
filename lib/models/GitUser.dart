

class GitUser extends Object {


  String login;

  String avatar_url;

  GitUser(Map<String, dynamic> userObject) {
    this.login = userObject["login"];
    this.avatar_url = userObject["avatar_url"];
  }

}
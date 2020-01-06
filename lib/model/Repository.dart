import 'package:json_annotation/json_annotation.dart';

part 'Repository.g.dart';


// @JsonSerializable(), json serializeable会根据这个标记 去查找需要解析的类
@JsonSerializable()
class Repository {
  int id;
  int size;
  String name;

  @JsonKey(name: 'full_name')
  String fullName;

  @JsonKey(name: 'html_url')
  String htmlUrl;

  String description;

  String language;

  @JsonKey(name: "default_branch")
  String defaultBranch;
@JsonKey(name: "created_at")
  DateTime createdAt;

  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  @JsonKey(name: "pushed_at")
  DateTime pushedAt;

  @JsonKey(name: "git_url")
  String gitUrl;

  @JsonKey(name: "ssh_url")
  String sshUrl;

  @JsonKey(name: "clone_url")
  String cloneUrl;

  @JsonKey(name: "svn_url")
  String svnUrl;

  @JsonKey(name: "stargazers_count")
  int stargazersCount;

  @JsonKey(name: "watchers_count")
  int watchersCount;

  @JsonKey(name: "forks_count")
  int forksCount;

  @JsonKey(name: "open_issues_count")
  int openIssuesCount;

  @JsonKey(name: "subscribers_count")
  int subscribersCount;

  @JsonKey(name: "private")
  bool private;

  bool fork;
  @JsonKey(name: "has_issues")
  bool hasIssues;
  @JsonKey(name: "has_projects")
  bool hasProjects;

  @JsonKey(name: "has_downloads")
  bool hasDownloads;

  @JsonKey(name: "has_wiki")
  bool hasWiki;

  @JsonKey(name: "has_pages")
  bool hasPages;

  // User owner;

  // License license;

  Repository parent;

  // RepositoryPermissions permissions;

  List<String> topics;

  ///issue总数，不参加序列化
  int allIssueCount;

  Repository(
    this.id,
    this.size,
    this.name,
    this.fullName,
    this.htmlUrl,
    this.description,
    this.language,
    // this.license,
    this.defaultBranch,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.stargazersCount,
    this.watchersCount,
    this.forksCount,
    this.openIssuesCount,
    this.subscribersCount,
    this.private,
    this.fork,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    // this.owner,
    this.parent,
    // this.permissions,
    this.topics,
  );

  factory Repository.fromJson(Map<String, dynamic> json) => _$RepositoryFromJson(json);
  Map<String, dynamic> toJson() => _$RepositoryToJson(this);

  // 命名构造函数
  Repository.empty();
}
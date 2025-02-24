import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_info.freezed.dart';

part 'repository_info.g.dart';

@freezed
class RepoInfo with _$RepoInfo {
  const factory RepoInfo({
    @JsonKey(name: 'total_count') required int totalCount,
    required List<RepoDataItems> items,
  }) = _RepoInfo;

  factory RepoInfo.fromJson(Map<String, dynamic> json) =>
      _$RepoInfoFromJson(json);
}

@freezed
class RepoDataItems with _$RepoDataItems {
  const factory RepoDataItems({
    @JsonKey(name: 'full_name') required String fullName,
    required RepoDataOwner owner,
    required String? description,
    required String? language,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
    @JsonKey(name: 'watchers_count') required int watchersCount,
    @JsonKey(name: 'forks_count') required int forksCount,
    @JsonKey(name: 'open_issues_count') required int openIssuesCount,
    @JsonKey(name: 'html_url') required String htmlUrl,
  }) = _RepoDataItems;

  factory RepoDataItems.fromJson(Map<String, dynamic> json) =>
      _$RepoDataItemsFromJson(json);
}

@freezed
class RepoDataOwner with _$RepoDataOwner {
  const factory RepoDataOwner({
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _RepoDataOwner;

  factory RepoDataOwner.fromJson(Map<String, dynamic> json) =>
      _$RepoDataOwnerFromJson(json);
}

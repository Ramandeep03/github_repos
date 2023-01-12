class Repos {
  final int? id;
  final String? name;
  final String? fullName;
  final String? description;
  final String? url;
  final String? language;
  final int? openIssues;
  final int? forks;
  final String? updatedAt;

  Repos( {
    this.id,
    this.name,
    this.fullName,
    this.description,
    this.url,
    this.language,
    this.openIssues,
    this.forks,
    this.updatedAt,
  });

  factory Repos.fromMap(Map<String, dynamic> map) {
    return Repos(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      fullName: map['full_name'] ?? "",
      description: map['description'] ?? "",
      url: map['html_url'] ?? "",
      language: map['language'] ?? "",
      openIssues: map['open_issues'] ?? 0,
      forks: map['forks'] ?? 0,
      updatedAt: map['updated_at']?? '',
    );
  }
}

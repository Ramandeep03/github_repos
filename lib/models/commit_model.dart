class Commit {
  final String? authorName;
  final String? authorEmail;
  final String? commitDate;
  final String? message;
  final String? url;

  Commit({
    this.authorName,
    this.authorEmail,
    this.commitDate,
    this.message,
    this.url,
  });

  factory Commit.fromMap(Map<String, dynamic> map){
    return Commit(
      authorName: map['commit']['author']['name'] ?? "",
      authorEmail: map['commit']['author']['email'] ?? "",
      commitDate: map['commit']['author']['date'] ?? "",
      message: map['commit']['message'] ?? "",
      url: map['html_url'] ?? ""
    );
  }
}

class Album {
  String id;
  String albumId;
  String title;
  String url;
  String thumbnailUrl;

  Album({this.id, this.albumId, this.title, this.url, this.thumbnailUrl});

  //Creates new album object from the json object
  Album.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        albumId=json['albumId'].toString(),
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];
}

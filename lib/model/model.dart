class Album {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  Album({this.id, this.albumId, this.title, this.url, this.thumbnailUrl});

  //Creates new album object from the json object
  Album.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        albumId=json['albumId'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];

  //Getter method to return id
  int getId(){
    return this.id;
  }
}

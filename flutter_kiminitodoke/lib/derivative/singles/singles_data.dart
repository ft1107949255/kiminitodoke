
// 商品数据
class SongsData {
  // id
  var id;

  // pic
  String avatar;

  // 名字
  String name;

  // songer
  String singer;

  // 描述
  String description;

  //price
  String url;

  SongsData( this.id, this.avatar, this.name, this.singer,  this.description, this.url, );
}


List<SongsData> songsData = [
  new SongsData(
      1,
      'images/singles/01.jpg',
      'きみにとどけ',
      'タニザワトモフミ',
      '',
      ''
  ),
  new SongsData(
      2,
      'images/singles/02.jpg',
      '片想い',
      'Chara',
      '',
      ''
  ),
  new SongsData(
      3,
      'images/singles/03.jpg',
      '爽风',
      'タニザワトモフミ',
      '',
      ''
  ),
  new SongsData(
      4,
      'images/singles/04.jpg',
      '君に届け...',
      "MSY'S",
      '',
      ''
  ),

];
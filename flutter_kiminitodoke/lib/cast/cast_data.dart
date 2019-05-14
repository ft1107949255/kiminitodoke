
// 聊天数据
class CastData {
  // id
   var id;

  // 头像
  String avatar;

  // 主标题
  String name;

  // 子标题
  String subTitle;

  // 描述
   String descriptionImg;

  CastData( this.id,  this.avatar, this.name, this.subTitle, this.descriptionImg);

}

List<CastData> castData = [
  new CastData(
     1,
    'images/cast/sawako.png',
    '黒沼爽子',
    'くろぬま　さわこ',
    'images/cast/sawako.gif',
  ),
  new CastData(
    2,
    'images/cast/kazehaya.png',
    '風早翔太',
    'かぜはや　しょうた',
    'images/cast/kazehaya.gif',
  ),
  new CastData(
    3,
    'images/cast/ryu.png',
    '真田龍',
    'まだ　りゅう',
    'images/cast/ryu.gif',
  ),
  new CastData(
    4,
    'images/cast/chizuru.png',
    '吉田千鶴',
    'よした　ちずる',
    'images/cast/chizuru.gif',
  ),
  new CastData(
    5,
    'images/cast/ayane.png',
    '矢野綾音',
    'やの　あやね',
    'images/cast/ayane.gif',
  ),
  new CastData(
    6,
    'images/cast/kurumi.png',
    '胡桃沢梅',
    'くるみざわ　うめ',
    'images/cast/kurumi.gif',
  ),
  new CastData(
    7,
    'images/cast/arai.png',
    '荒井一市',
    'あらい　かずいち　',
    'images/cast/arai.gif',
  ),
  new CastData(
    8,
    'images/cast/kento.png',
    '三浦健人',
    'みうら　けんと　',
    'images/cast/kento.gif',
  ),
];
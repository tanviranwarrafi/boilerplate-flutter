import 'package:app/utils/assets.dart';

class DataModel {
  String label;
  String value;
  int valueInt;
  String icon;

  DataModel({this.label = '', this.value = '', this.valueInt = 0, this.icon = ''});

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['label'] = label;
    map['value'] = value;
    map['valueInt'] = valueInt;
    map['icon'] = icon;
    return map;
  }
}

var camera_option = DataModel(value: 'camera', icon: Assets.svg.camera, label: 'Take a Photo');
var gallery_option = DataModel(value: 'gallery', icon: Assets.svg.image_square, label: 'Upload from Gallery');

var SHARE = DataModel(label: 'Share', value: 'share', icon: Assets.svg.arrow_bend_up_right);
var DELETE = DataModel(label: 'Delete', value: 'delete', icon: Assets.svg.trash);
List<DataModel> RECORD_MENU_LIST = [SHARE, DELETE];

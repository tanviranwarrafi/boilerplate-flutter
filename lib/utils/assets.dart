const _PNG_IMAGES = 'assets/png_images';
const _SVG_ICONS = 'assets/svg_icons';
const _SVG_IMAGES = 'assets/svg_images';

class Assets {
  Assets._();
  static _PngImages png_image = _PngImages();
  static _SvgIcons svg = _SvgIcons();
  static _SvgImages svg_image = _SvgImages();
}

class _PngImages {
  _PngImages();
  String door_open = '$_PNG_IMAGES/door_open.png';
  String no_camera = '$_PNG_IMAGES/no_camera.png';
  String not_found = '$_PNG_IMAGES/not_found.png';
  String security = '$_PNG_IMAGES/security.png';
  String tab_support = '$_PNG_IMAGES/tab_support.png';
}

class _SvgIcons {
  _SvgIcons();
  String apple = '$_SVG_ICONS/apple.svg';
  String arrow_bend_up_right = '$_SVG_ICONS/arrow_bend_up_right.svg';
  String arrow_elbow_right_down = '$_SVG_ICONS/arrow_elbow_right_down.svg';
  String arrow_elbow_up_left = '$_SVG_ICONS/arrow_elbow_up_left.svg';
  String arrow_elbow_up_right = '$_SVG_ICONS/arrow_elbow_up_right.svg';
  String arrow_left = '$_SVG_ICONS/arrow_left.svg';
  String arrow_right = '$_SVG_ICONS/arrow_right.svg';
  String bookmark_1 = '$_SVG_ICONS/bookmark_1.svg';
  String bookmark_2 = '$_SVG_ICONS/bookmark_2.svg';
  String briefcase = '$_SVG_ICONS/briefcase.svg';
  String calendar = '$_SVG_ICONS/calendar.svg';
  String camera = '$_SVG_ICONS/camera.svg';
  String caret_left = '$_SVG_ICONS/caret_left.svg';
  String caret_right = '$_SVG_ICONS/caret_right.svg';
  String check = '$_SVG_ICONS/check.svg';
  String check_false = '$_SVG_ICONS/check_false.svg';
  String check_true = '$_SVG_ICONS/check_true.svg';
  String close = '$_SVG_ICONS/close.svg';
  String crop = '$_SVG_ICONS/crop.svg';
  String dots_three = '$_SVG_ICONS/dots_three.svg';
  String envelope = '$_SVG_ICONS/envelope.svg';
  String eye_show = '$_SVG_ICONS/eye_show.svg';
  String eye_hide = '$_SVG_ICONS/eye_hide.svg';
  String file_text = '$_SVG_ICONS/file_text.svg';
  String folder_open = '$_SVG_ICONS/folder_open.svg';
  String hamburger = '$_SVG_ICONS/hamburger.svg';
  String image_square = '$_SVG_ICONS/image_square.svg';
  String info = '$_SVG_ICONS/info.svg';
  String lightning_1 = '$_SVG_ICONS/lightning_1.svg';
  String lightning_2 = '$_SVG_ICONS/lightning_2.svg';
  String lock = '$_SVG_ICONS/lock.svg';
  String map_pin = '$_SVG_ICONS/map_pin.svg';
  String pencil = '$_SVG_ICONS/pencil.svg';
  String scan = '$_SVG_ICONS/scan.svg';
  String search = '$_SVG_ICONS/search.svg';
  String sign_out = '$_SVG_ICONS/sign_out.svg';
  String trash = '$_SVG_ICONS/trash.svg';
  String user = '$_SVG_ICONS/user.svg';
  String user_circle = '$_SVG_ICONS/user_circle.svg';
}

class _SvgImages {
  _SvgImages();
  String google = '$_SVG_IMAGES/google.svg';
  String image = '$_SVG_IMAGES/image.svg';
  String info = '$_SVG_IMAGES/info.svg';
  String microsoft = '$_SVG_IMAGES/microsoft.svg';
  String scanner = '$_SVG_IMAGES/scanner.svg';
  String tab_support = '$_SVG_IMAGES/tab_support.svg';
  String whats_app = '$_SVG_IMAGES/whats_app.svg';
}

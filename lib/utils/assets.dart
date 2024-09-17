const _APP_ICONS = 'assets/app_icons';
const _BACKGROUNDS = 'assets/backgrounds';
const _PNG_IMAGES = 'assets/png_images';
const _SVG_ICONS = 'assets/svg_icons';
const _SVG_IMAGES = 'assets/svg_images';

class Assets {
  Assets._();
  static _AppIcons app_icon = _AppIcons();
  static _Backgrounds background = _Backgrounds();
  static _PngImages png_image = _PngImages();
  static _SvgIcons svg = _SvgIcons();
  static _SvgImages svg_image = _SvgImages();
}

class _AppIcons {
  _AppIcons();
  String skantrix = '$_APP_ICONS/skantrix.svg';
  String skantrix_name = '$_APP_ICONS/skantrix_name.png';
}

class _Backgrounds {
  _Backgrounds();
  String background_1 = '$_BACKGROUNDS/background_1.png';
  String background_2 = '$_BACKGROUNDS/background_2.png';
  String background_3 = '$_BACKGROUNDS/background_3.png';
  String background_4 = '$_BACKGROUNDS/background_4.png';
  String background_5 = '$_BACKGROUNDS/background_5.png';
}

class _PngImages {
  _PngImages();
  String calculator = '$_PNG_IMAGES/calculator.png';
  String door_open = '$_PNG_IMAGES/door_open.png';
  String folder = '$_PNG_IMAGES/folder.png';
  String lung = '$_PNG_IMAGES/lung.png';
  String news = '$_PNG_IMAGES/news.png';
  String no_camera = '$_PNG_IMAGES/no_camera.png';
  String not_found = '$_PNG_IMAGES/not_found.png';
  String security = '$_PNG_IMAGES/security.png';
  String stomach = '$_PNG_IMAGES/stomach.png';
  String tab_support = '$_PNG_IMAGES/tab_support.png';
  String tool_box = '$_PNG_IMAGES/tool_box.png';
  String trash_bin = '$_PNG_IMAGES/trash_bin.png';
  String trash_folder = '$_PNG_IMAGES/trash_folder.png';
  String trouble_1 = '$_PNG_IMAGES/trouble_1.png';
  String trouble_2 = '$_PNG_IMAGES/trouble_2.png';
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
  String calculator = '$_SVG_IMAGES/calculator.svg';
  String gmail = '$_SVG_IMAGES/gmail.svg';
  String google = '$_SVG_IMAGES/google.svg';
  String image = '$_SVG_IMAGES/image.svg';
  String info = '$_SVG_IMAGES/info.svg';
  String layout = '$_SVG_IMAGES/layout.svg';
  String microsoft = '$_SVG_IMAGES/microsoft.svg';
  String scanner = '$_SVG_IMAGES/scanner.svg';
  String tab_support = '$_SVG_IMAGES/tab_support.svg';
  String whats_app = '$_SVG_IMAGES/whats_app.svg';
}

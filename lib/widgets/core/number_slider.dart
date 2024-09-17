import 'package:app/themes/colors.dart';
import 'package:app/themes/fonts.dart';
import 'package:app/themes/text_styles.dart';
import 'package:flutter/material.dart';

const _BORDER = BorderSide(color: purpleLight);

class NumberSlider extends StatefulWidget {
  final int start;
  final int length;
  final int initialValue;
  final Function(int)? onChanged;

  NumberSlider({this.start = 0, this.length = 100, this.onChanged, this.initialValue = 30});

  @override
  State<NumberSlider> createState() => _NumberSliderState();
}

class _NumberSliderState extends State<NumberSlider> {
  var _itemList = <int>[];
  var _selectedItem = 30;
  var _pageController = PageController(viewportFraction: 0.15);

  @override
  void initState() {
    _selectedItem = widget.initialValue;
    _itemList = List.generate(widget.length, (index) => widget.start + index);
    var initialIndex = _itemList.indexWhere((item) => item == _selectedItem);
    _pageController = PageController(viewportFraction: 0.15, initialPage: initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _itemList.length,
      // allowImplicitScrolling: false,
      physics: const BouncingScrollPhysics(),
      // pageSnapping: true,
      onPageChanged: _onChanged,
      itemBuilder: (context, index) {
        var item = _itemList[index];
        var selected = item == _selectedItem;
        var opacity = _getOpacity(index);
        // var scale = _getScale(index);
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: transparent, border: !selected ? null : const Border(left: _BORDER, right: _BORDER)),
          child: Opacity(
            opacity: opacity,
            child: Text(
              item < 10 ? '0$item' : '$item',
              maxLines: 1,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: TextStyles.text20_500.copyWith(fontSize: selected ? 32 : 24, fontWeight: selected ? w600 : w500, color: white),
            ),
          ),
        );
      },
    );
  }

  void _onChanged(int index) {
    setState(() => _selectedItem = _itemList[index]);
    if (widget.onChanged != null) widget.onChanged!(_selectedItem);
  }

  double _getOpacity(int index) {
    var selectedIndex = _itemList.indexWhere((item) => item == _selectedItem);
    var distance = (index - selectedIndex).abs();
    switch (distance) {
      case 0:
        return 1;
      case 1:
        return 0.7;
      case 2:
        return 0.5;
      default:
        return 0.3;
    }
  }

/*double _getScale(int index) {
    var selectedIndex = _itemList.indexWhere((item) => item == _selectedItem);
    var distance = (index - selectedIndex).abs();
    switch (distance) {
      case 0:
        return 200;
      default:
        return 50;
    }
  }*/
}

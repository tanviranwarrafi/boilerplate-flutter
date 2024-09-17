import 'package:app/constants/date_formats.dart';
import 'package:app/di.dart';
import 'package:app/extensions/flutter_ext.dart';
import 'package:app/libraries/formatters.dart';
import 'package:app/themes/colors.dart';
import 'package:app/themes/text_styles.dart';
import 'package:app/utils/assets.dart';
import 'package:app/widgets/library/svg_image.dart';
import 'package:flutter/material.dart';

class DatePickerView extends StatelessWidget {
  final String hint;
  final bool showPicker;
  final String dateFormat;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? initialDate;
  final Function(DateTime)? onChanged;

  const DatePickerView({
    required this.firstDate,
    required this.lastDate,
    required this.initialDate,
    this.hint = 'Select date',
    this.showPicker = true,
    this.dateFormat = DATE_FORMAT_14,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: initialDate != null && !showPicker ? null : () => _showDatePicker(context),
      child: Container(
        height: 48,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(color: offWhite2, borderRadius: BorderRadius.circular(08)),
        child: Row(
          children: [
            const SizedBox(width: 13),
            SvgImage(image: Assets.svg.calendar, height: 20, color: grey2),
            const SizedBox(width: 13),
            Expanded(
              child: Text(
                initialDate == null ? hint : sl<Formatters>().formatDate(dateFormat, '$initialDate'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.text14_500.copyWith(color: grey2),
              ),
            ),
            const SizedBox(width: 13),
          ],
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    minimizeKeyboard();
    var picked = await showDatePicker(
        context: context, lastDate: lastDate, firstDate: firstDate, currentDate: currentDate, initialDate: initialDate ?? currentDate);
    minimizeKeyboard();
    if (picked != null && onChanged != null) onChanged!(picked);
  }
}

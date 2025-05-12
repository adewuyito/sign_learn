import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/core/constants/dimensions.dart';
import 'package:sign_learn/gen/fonts.gen.dart';

import '../../../../common/commons.dart';
import '../../../../core/core.dart' show appColors, YBox, DimsExtension;

class StreakWeekCalander extends HookConsumerWidget {
  const StreakWeekCalander({super.key, required Size size})
      : _widgetSize = size;

  final Size _widgetSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = useState(DateTime.now());

    List<DateTime> getFiveDayWindow(DateTime date) {
      return List.generate(5, (index) => date.add(Duration(days: index - 2)));
      // -2 puts today in the center with 2 before and 2 after
    }

    final visibleDates = getFiveDayWindow(today.value);
    final _weekday = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ][today.value.weekday - 1];

    final _calenderMonth = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October ",
      "November ",
      "December ",
    ][today.value.month - 1];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$_weekday, ${today.value.day} $_calenderMonth",
          style: TextTheme.of(context)
              .labelLarge!
              .copyWith(fontFamily: FontFamily.satoshi),
        ),
        YBox(padding.dy),
        BoxOutline(
          size: _widgetSize,
          backGroundColor: Color(0xFFF6E2C4),
          child: Container(
            width: _widgetSize.width,
            height: _widgetSize.height,
            decoration: BoxDecoration(
              color: appColors.white,
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: visibleDates.map(
                (date) {
                  final isToday = date.day == today.value.day &&
                      date.month == today.value.month &&
                      date.year == today.value.year;
                  return Container(
                    width: 56.dx,
                    height: 109.dy,
                    decoration: BoxDecoration(
                      color:
                          isToday ? appColors.paleGreen : appColors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      border: isToday
                          ? Border.all(color: appColors.black, width: 2)
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${date.day}",
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            color: appColors.black,
                            fontSize: 25.sp,
                            fontWeight:
                                isToday ? FontWeight.w900 : FontWeight.bold,
                          ),
                        ),
                        YBox(13.dy),
                        Text(
                          [
                            "Mon",
                            "Tue",
                            "Wed",
                            "Thu",
                            "Fri",
                            "Sat",
                            "Sun"
                          ][date.weekday - 1],
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontFamily: 'Satoshi',
                            color: appColors.black,
                            fontWeight:
                                isToday ? FontWeight.w900 : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

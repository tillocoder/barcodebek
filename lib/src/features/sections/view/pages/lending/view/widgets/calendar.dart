import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending/controller/calendar_ctr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends ConsumerWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(calendarController);
    var ctrCalendar = ref.watch(calendarController);

    return TableCalendar(
      calendarStyle: CalendarStyle(
        withinRangeTextStyle: AppTextStyle.textPrces
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: AppTextStyle.textStyle6,
        weekendStyle: const TextStyle(color: Colors.red),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      availableCalendarFormats: const {CalendarFormat.month: 'Hafta ichida', CalendarFormat.twoWeeks: 'Oy ', CalendarFormat.week: 'Keyingi hafta'},
      startingDayOfWeek: StartingDayOfWeek.sunday,
      locale: prefs.getString('lang'),
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: ctrCalendar.focusedDay,
      selectedDayPredicate: (day) => isSameDay(ctrCalendar.selectedDay, day),
      rangeStartDay: ctrCalendar.rangeStart,
      rangeEndDay: ctrCalendar.rangeEnd,
      calendarFormat: ctrCalendar.calendarFormat,
      rangeSelectionMode: ctrCalendar.rangeSelectionMode,
      onDaySelected: (selectedDay, focusedDay) {
        ctrCalendar.onDaySelected(selectedDay, focusedDay);
      },
      onRangeSelected: (start, end, focusedDay) {
        ctrCalendar.onRangeSelected(start, end, focusedDay);
      },
      onFormatChanged: (format) {
        ctrCalendar.onFormatChanged(format);
      },
      // onPageChanged: (focusedDay) {
      //   ctrCalendar.focusedDay = focusedDay;
      // },
    );
  }
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

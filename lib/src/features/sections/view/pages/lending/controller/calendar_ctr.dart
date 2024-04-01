import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

final calendarController = ChangeNotifierProvider.autoDispose((ref) => CalendarController());

class CalendarController extends ChangeNotifier {
  CalendarFormat calendarFormat = CalendarFormat.twoWeeks;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;

  void onDaySelected(selectedDayy, focusedDay) {
    if (!isSameDay(selectedDay, selectedDayy)) {
      selectedDay = selectedDay;
      focusedDay = focusedDay;
      rangeStart = null; // Important to clean those
      rangeEnd = null;
      rangeSelectionMode = RangeSelectionMode.toggledOff;
      notifyListeners();
    }
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDayy) {
    selectedDay = null;
    focusedDay = focusedDayy;
    rangeStart = start;
    rangeEnd = end;
    rangeSelectionMode = RangeSelectionMode.toggledOn;
    notifyListeners();
    print('DAYYYYY$rangeEnd');
  }

  void onFormatChanged(CalendarFormat format) {
    if (calendarFormat != format) {
      calendarFormat = format;
          print('calendarFormad: $calendarFormat');
    }
    notifyListeners();
  }
}

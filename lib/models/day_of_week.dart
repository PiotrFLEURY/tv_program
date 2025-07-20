enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension DayOfWeekExtension on DayOfWeek {
  String get name {
    switch (this) {
      case DayOfWeek.monday:
        return 'Lundi';
      case DayOfWeek.tuesday:
        return 'Mardi';
      case DayOfWeek.wednesday:
        return 'Mercredi';
      case DayOfWeek.thursday:
        return 'Jeudi';
      case DayOfWeek.friday:
        return 'Vendredi';
      case DayOfWeek.saturday:
        return 'Samedi';
      case DayOfWeek.sunday:
        return 'Dimanche';
    }
  }
}

DayOfWeek from(int dayofweek) {
  switch (dayofweek) {
    case 1:
      return DayOfWeek.monday;
    case 2:
      return DayOfWeek.tuesday;
    case 3:
      return DayOfWeek.wednesday;
    case 4:
      return DayOfWeek.thursday;
    case 5:
      return DayOfWeek.friday;
    case 6:
      return DayOfWeek.saturday;
    case 7:
      return DayOfWeek.sunday;
    default:
      throw ArgumentError('Invalid day of week: $dayofweek');
  }
}

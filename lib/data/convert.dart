class Convert {
  //function to convert min to hr and min
  static String convertMtoHM(int totalMin) {
    final int hour = totalMin ~/ 60;
    final int minutes = totalMin % 60;
    //hour format default to 1 digit
    String hourString = hour.toString().padLeft(1, '0');
    //minutes format default to 1 digits
    String minString = minutes.toString().padLeft(1, '0');
    if (hour >= 10) {
      //hour format for 2 digit
      hourString = hour.toString().padLeft(2, '0');
    }
    //minutes format default to 1 digit
    if (minutes >= 10) {
      minString = minutes.toString().padLeft(2, '0');
    }

    if (hourString == '0' || hourString == '00') {
      return '${minString}m';
    } else if (minString == '0' || minString == '00') {
      return '${hourString}h';
    }
    return '${hourString}h ${minutes}m';
  }
}

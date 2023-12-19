String getFormattedDateTime(DateTime dateTime) {
  // Get the current date and time
  DateTime now = DateTime.now();

  // Calculate the time difference
  Duration difference = now.difference(dateTime);

  // Format the difference as a human-readable string
  String formattedDifference = formatTimeDifference(difference);

  return formattedDifference;
}

String formatTimeDifference(Duration difference) {
  if (difference.inDays >= 365) {
    int years = difference.inDays ~/ 365;
    return '$years ${years == 1 ? 'year' : 'years'} ago';
  } else if (difference.inDays >= 30) {
    int months = difference.inDays ~/ 30;
    return '$months ${months == 1 ? 'month' : 'months'} ago';
  } else if (difference.inDays > 0) {
    if (difference.inDays == 1) {
      return 'yesterday';
    } else {
      return '${difference.inDays} days ago';
    }
  } else if (difference.inHours > 0) {
    if (difference.inHours == 1) {
      return 'an hour ago';
    } else {
      return '${difference.inHours} hours ago';
    }
  } else {
    return 'less than an hour ago';
  }
}

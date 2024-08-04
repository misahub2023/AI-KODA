class DataSet {
  static String imagePath = 'imagePath';
  static String option11 = '>75%';
  static String option12 = '50%-75%';
  static String option13 = '25%-49%';
  static String option14 = '<25%';
  static String option21 = '<5%';
  static String option22 = '5%-25%';
  static String option23 = '26%-50%';
  static String option24 = '>50%';
  static String date = 'Date';
  static String user = 'User';

  static List<String> getFields() => [
        imagePath,
        option11,
        option12,
        option13,
        option14,
        option21,
        option22,
        option23,
        option24,
        date,
        user,
      ];
}

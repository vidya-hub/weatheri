extension StringExtension on String {
  get toCamelCase {
    List<String> words = trim().split(RegExp(r'[\s_-]+'));
    String camelCaseStr = "";
    for (int i = 0; i < words.length; i++) {
      camelCaseStr +=
          "${words[i][0].toUpperCase()}${words[i].substring(1).toLowerCase()} ";
    }
    return camelCaseStr;
  }
}

void main() {
  String word1 = 'listen';
  String word2 = 'silent';

  bool areAnagrams(String str1, String str2) {
    List<String> sortedStr1 = str1.split('')..sort();
    List<String> sortedStr2 = str2.split('')..sort();
    return sortedStr1.join() == sortedStr2.join();
  }

  if (areAnagrams(word1, word2)) {
    print('The words "$word1" and "$word2" are anagrams.');
  } else {
    print('The words "$word1" and "$word2" are not anagrams.');
  }
}

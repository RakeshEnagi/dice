class QuizQuestion {
  const QuizQuestion(this.text, this.answer);
  final String text;
  final List<String> answer;

  List<String> getshuffledanswers() {
    //list.of() creates a dulpicate if the original
    final shuffledlist = List.of(answer);
    //chaining the functions like list.of().shuffle()
    shuffledlist.shuffle();
    return shuffledlist;
  }
}

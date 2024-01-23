
class QuizQuestion{
  const QuizQuestion(this.text,this.answers);
  final String text;
  final List<String> answers;
  List<String> getShuffledAnswers(){
    final ans=List.of(answers);
    ans.shuffle();
    return ans;
  }
}

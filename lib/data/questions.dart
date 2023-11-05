import 'package:introapp2/models/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "Aşağidakilerden hangisi Flutter'da bir widget türüdür?",
    {
      "Stateful": true,
      "Constructor": false,
      "Class": false,
      "Const": false,
    },
  ),
  QuestionModel(
    "Flutter hangi dil kullanılarak geliştirilmektedir?",
    {
      "Python": false,
      "JavaScript": false,
      "Dart": true,
      "C++": false,
    },
  ),
  QuestionModel(
    "Flutter'da Widget nedir?",
    {
      "const değerler widget'dır.": false,
      "class yapıları widget'dır.": false,
      "Sadece text bir widget'dır.": false,
      "Flutter'da herşey widget'dır.": true,
    },
  ),
  QuestionModel(
    "Tüm eklentileri güncelleme komutu nedir?",
    {
      "flutter pub upgrade": true,
      "fstful": false,
      "flutter create": false,
      "flutter": false,
    },
  ),
  QuestionModel(
    "Bir widget’ın boyutunu ekran boyutuna göre nasıl ayarlarsınız?",
    {
      "double.infinity": false,
      "MediaQuery.of(context).size": true,
      "EdgeInsets.symmetric": false,
      "mainAxisAlignment: MainAxisAlignment.center": false,
    },
  ),
  QuestionModel(
    "Döngü şartı geçerli olmasa bile en az bir kere çalışacak döngü türü hangisidir?",
    {
      "do-while": true,
      "for": false,
      "if": false,
      "while": false,
    },
  ),
  QuestionModel(
    "Aşağıdakilerden hangisi Column Widget tanımlama parametrelerinden biri değildir?",
    {
      "child": false,
      "mainAxisAlignment": false,
      "children": true,
      "crossAxisAlignment": false,
    },
  ),
  QuestionModel(
    "Bir önceki sayfaya geçmek için aşağıdaki Navigator fonksiyonlarından hangisi kullanılır?",
    {
      "push": false,
      "goto": false,
      "delete": false,
      "pop": true,
    },
  ),
  QuestionModel(
    "Aşağıdakilerden hangisi Scaffold Widget tanımlama özelliklerinden biri değildir?",
    {
      "floatingActionButton": true,
      "body": false,
      "animation": false,
      "appBar": false,
    },
  ),
  QuestionModel(
    "Bir Column içine beş adet Row bırakmak isteyen bir flutter geliştiricisi Column Widget'ının hangi özelliğini kullanmalıdır?",
    {
      "text": false,
      "parent": false,
      "child": false,
      "children": true,
    },
  ),
];

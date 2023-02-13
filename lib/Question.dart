class Question {
  final String question;
  final String user;
  final DateTime date;

  Question({
    required this.question,
    required this.user,
    required this.date,
  });

  Map<String, dynamic> toJson() =>
      {
        'pitanje' : question,
        "korisnik" : user,
        'datum' : date,
      };
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_hire/features/auth/presentation/authentication/test/SuccessPage.dart';

class TestScreen extends StatefulWidget {
  final String? jobType;

  const TestScreen({Key? key, this.jobType}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int currentQuestionIndex = 0;
  int remainingTime = 900;
  late Timer timer;
  String? selectedAnswer;
  int score = 0;
  List<Question> questions = [];

  @override
  void initState() {
    super.initState();
    loadQuestions();
    startTimer();
  }

  void loadQuestions() {
    switch (widget.jobType) {
      case 'Software Engineer':
        questions = [
          Question(
            questionText: "What is the time complexity of binary search?",
            options: ["O(n)", "O(log n)", "O(n^2)", "O(1)"],
            correctAnswer: "O(log n)",
          ),
          Question(
            questionText: "What is polymorphism in OOP?",
            options: [
              "Encapsulation",
              "Inheritance",
              "Abstraction",
              "Method Overloading",
            ],
            correctAnswer: "Method Overloading",
          ),
        ];
        break;

      case 'Graphic Designer':
        questions = [
          Question(
            questionText: "Which software is commonly used for graphic design?",
            options: ["Photoshop", "Excel", "PowerPoint", "Word"],
            correctAnswer: "Photoshop",
          ),
          Question(
            questionText: "What does RGB stand for?",
            options: [
              "Red Green Blue",
              "Rotate Graphic Blur",
              "Random Gradient Base",
              "None of the above",
            ],
            correctAnswer: "Red Green Blue",
          ),
        ];
        break;

      case 'Network Engineer':
        questions = [
          Question(
            questionText: "What does IP stand for?",
            options: [
              "Internet Protocol",
              "Internal Process",
              "Information Provider",
              "None of the above",
            ],
            correctAnswer: "Internet Protocol",
          ),
          Question(
            questionText: "What layer is responsible for routing in OSI?",
            options: [
              "Transport Layer",
              "Network Layer",
              "Session Layer",
              "Data Link Layer",
            ],
            correctAnswer: "Network Layer",
          ),
        ];
        break;
      case 'Frontend Developer':
        questions = [
          Question(
            questionText: "What does IP stand for?",
            options: [
              "Internet Protocol",
              "Internal Process",
              "Information Provider",
              "None of the above",
            ],
            correctAnswer: "Internet Protocol",
          ),
          Question(
            questionText: "What layer is responsible for routing in OSI?",
            options: [
              "Transport Layer",
              "Network Layer",
              "Session Layer",
              "Data Link Layer",
            ],
            correctAnswer: "Network Layer",
          ),
        ];
        break;
      case 'Backend Developer':
        questions = [
          Question(
            questionText: "What does IP stand for?",
            options: [
              "Internet Protocol",
              "Internal Process",
              "Information Provider",
              "None of the above",
            ],
            correctAnswer: "Internet Protocol",
          ),
          Question(
            questionText: "What layer is responsible for routing in OSI?",
            options: [
              "Transport Layer",
              "Network Layer",
              "Session Layer",
              "Data Link Layer",
            ],
            correctAnswer: "Network Layer",
          ),
        ];
        break;

      default:
        questions = [];
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        showResultDialog();
      }
    });
  }

  void checkAnswer() {
    if (selectedAnswer == questions[currentQuestionIndex].correctAnswer) {
      score++;
    }
  }

  void showResultDialog() {
    bool isPassed = score >= (questions.length / 2);

    if (isPassed) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessPage(
            text:
                "Your are  passed the Exam.\nyou will redirected to Home page.",
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Test Failed"),
          content: Text(
            "You scored $score/${questions.length}. Please try again.",
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                  selectedAnswer = null;
                  remainingTime = 900;
                  startTimer();
                });
              },
              child: Text("Restart Quiz"),
            ),
          ],
        ),
      );
    }
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple Test',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
        ),
        backgroundColor: const Color.fromARGB(255, 250, 247, 247),
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: currentQuestionIndex < questions.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        "Time Remaining: ${formatTime(remainingTime)}",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Question ${currentQuestionIndex + 1}/${questions.length}",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(height: 20),
                  Text(
                    questions[currentQuestionIndex].questionText,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 20.h),
                  ...questions[currentQuestionIndex].options.map(
                    (option) => RadioListTile(
                      title: Text(option),
                      value: option,
                      activeColor: Colors.blue,
                      groupValue: selectedAnswer,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswer = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: currentQuestionIndex > 0
                            ? () {
                                setState(() {
                                  currentQuestionIndex--;
                                  selectedAnswer = null;
                                });
                              }
                            : null,
                        child: Text("Previous"),
                      ),
                      ElevatedButton(
                        onPressed: selectedAnswer != null
                            ? () {
                                checkAnswer();
                                setState(() {
                                  if (currentQuestionIndex <
                                      questions.length - 1) {
                                    currentQuestionIndex++;
                                    selectedAnswer = null;
                                  } else {
                                    timer.cancel();
                                    showResultDialog();
                                  }
                                });
                              }
                            : null,
                        child: Text(
                          currentQuestionIndex == questions.length - 1
                              ? "Finish"
                              : "Next",
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentQuestionIndex = 0;
                      score = 0;
                      selectedAnswer = null;
                      remainingTime = 900;
                      startTimer();
                    });
                  },
                  child: Text("Restart Quiz"),
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}

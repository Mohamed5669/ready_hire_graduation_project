import 'package:flutter/material.dart';

import 'assets_manager.dart';
import 'colors_manager.dart';

class ConstantsManager {
  static const String welcome =
      'Recruitment has become \n    easier... Find out how! ';
  static const String description =
      'With READY HIRE, we build bridges between \n     competencies and opportunities.';
  static const String onBoardingTitle1 =
      "Carry out your projects\n with the best professionals\n easily and flexibly.";
  static const String onBoardingDescription1 =
      "For Business Owners : Hire the\n right talent for your needs,\n whether on permanent,\n temporary, or freelancing.";
  static const String onBoardingTitle2 =
      "For Job Seekers Whether you are\n looking for a full-time job or\n want to be self-employed, we\n are here to support you.";
  static const String onBoardingTitle3 =
      "A platform that brings together\n business owners and talented\n people of all kinds of\n employment.";

  static const List<Map<String, String>> employees = [
    {
      'Image': 'assets/images/Full Stack.jpeg',
      'Name': 'John Doe',
      'jobTitle': 'Software Engineer',
      'location': 'San Francisco',
      'description': 'Experienced in mobile app development.',
      'jobType': 'Full Time',
    },
    {
      'Image': 'assets/images/Full Stack.jpeg',
      'Name': 'Jane Smith',
      'jobTitle': 'UI/UX Designer',
      'location': 'New York',
      'description': 'Passionate about design and user experience.',
      'jobType': 'Full Time',
    },
    {
      'Image': 'assets/images/Full Stack.jpeg',
      'Name': 'Mohammed Gad',
      'jobTitle': 'UI/UX Designer',
      'location': 'California, United States',
      'description': "A UI/UX Designer handles both UI and UX Development...",
      'jobType': 'Full Time',
    },
    {
      'Image': 'assets/images/Full Stack.jpeg',
      'Name': 'Mohammed samy',
      'jobTitle': 'fluter developer',
      'location': 'California, United States',
      'description': "A UI/UX Designer handles both UI and UX Development...",
      'jobType': 'Full Time',
    },
    {
      'Image': 'assets/images/Full Stack.jpeg',
      'Name': 'Mohammed ',
      'jobTitle': 'Back End Engineer',
      'location': 'California, United States',
      'description': "A UI/UX Designer handles both UI and UX Development...",
      'jobType': 'Full Time',
    },
    {
      'Image': 'assets/images/Full Stack.jpeg',
      'Name': 'Ahmed',
      'jobTitle': 'Front End Engineer',
      'location': 'California, United States',
      'description': "A UI/UX Designer handles both UI and UX Development...",
      'jobType': 'Full Time',
    },
  ];
  static const List<Map<String, String>> companies = [
    {
      'companyImage': 'assets/images/google.png',
      'companyName': 'Google LLC',
      'jobTitle': 'UI/UX Designer',
      'location': 'California, United States',
      'salary': '\$10,000 - \$25,000 /month',
      'jobType': 'Full Time',
    },
    {
      'companyImage': 'assets/images/google_sing.png',
      'companyName': 'Snap LLC',
      'jobTitle': 'UI/UX Designer',
      'location': 'California, United States',
      'salary': '\$10,000 - \$25,000 /month',
      'jobType': 'Full Time',
    },
    {
      'companyImage': 'assets/images/face.png',
      'companyName': 'Facebook LLC',
      'jobTitle': 'Back End Engineer',
      'location': 'California, United States',
      'salary': '\$10,000 - \$25,000 /month',
      'jobType': 'Full Time',
    },
    {
      'companyImage': 'assets/images/twitter.png',
      'companyName': 'X LLC',
      'jobTitle': 'Front End Engineer',
      'location': 'California, United States',
      'salary': '',
      'jobType': 'Full Time',
    },
  ];
}

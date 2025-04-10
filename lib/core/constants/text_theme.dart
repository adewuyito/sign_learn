import 'package:flutter/material.dart';


TextTheme signLearnTextTheme = TextTheme(
  /* HEADLINE STYLING */
  headlineLarge: const TextStyle().copyWith(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  headlineMedium: const TextStyle().copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
  headlineSmall: const TextStyle().copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),

  /* TITLE STYLING */
  titleLarge: const TextStyle().copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
  titleMedium: const TextStyle().copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  titleSmall: const TextStyle().copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),

  /* BODY STYLING */
  bodyLarge: const TextStyle().copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  bodyMedium: const TextStyle().copyWith(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
  bodySmall: const TextStyle().copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black.withValues(alpha: 0.5),
  ),

  /* LABEL STYLING */
  labelLarge: const TextStyle().copyWith(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  labelMedium: const TextStyle().copyWith(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  labelSmall: const TextStyle().copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
);

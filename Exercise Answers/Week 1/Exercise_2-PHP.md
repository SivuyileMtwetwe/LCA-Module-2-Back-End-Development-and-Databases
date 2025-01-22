# Variables, Data Types, and Scope

## Overview

_Explore PHP variables, their data types, and the importance of scope in managing your code effectively._

## Tasks

1. ### Personal Bio with Variables
    Create variables for your name, age, favorite color, and favorite hobby. Display them as a formatted paragraph:
    • *"Hi, I'm John. I'm 25 years old, my favorite color is blue, and I love playing chess."*
2. ### BMI Calculator
    Write a script to calculate BMI given height (in meters) and weight (in kilograms). Print the result in the format:
    • "Your BMI is: 22.3 (Normal weight)."
3. ### Global vs Local Variables
    Declare a global variable $globalVar. Use a function to demonstrate how global variables behave differently from local ones by modifying the global value.
4. ### Type Conversion Experiment
    Assign a float value to a variable and convert it to an integer using intval(). Print both the original and converted value
5. ### Data Type Identification
    Use the gettype() function to identify and print the types of various variables (integer, float, string, and array).



<?php

// 1. Personal Bio with Variables
$name = "John";
$age = 25;
$favoriteColor = "blue";
$favoriteHobby = "playing chess";

// Displaying the formatted paragraph
echo "Hi, I'm $name. I'm $age years old, my favorite color is $favoriteColor, and I love $favoriteHobby.";

// 2. BMI Calculator
$height = 1.75; // in meters
$weight = 68; // in kilograms
$bmi = $weight / ($height * $height);

// Categorizing BMI
if ($bmi < 18.5) {
    $category = "Underweight";
} elseif ($bmi < 24.9) {
    $category = "Normal weight";
} elseif ($bmi < 29.9) {
    $category = "Overweight";
} else {
    $category = "Obesity";
}

echo "\nYour BMI is: " . number_format($bmi, 1) . " ($category).";

// 3. Global vs Local Variables
$globalVar = 10;

function modifyGlobalVar() {
    global $globalVar;
    $globalVar += 5; // Modifying global variable
    echo "\nInside function: Global variable is $globalVar.";
}

modifyGlobalVar();
echo "\nOutside function: Global variable is $globalVar.";

// 4. Type Conversion Experiment
$floatValue = 12.78;
$integerValue = intval($floatValue);

echo "\nOriginal value: $floatValue";
echo "\nConverted value: $integerValue";

// 5. Data Type Identification
$integerVar = 10;
$floatVar = 20.5;
$stringVar = "Hello, PHP!";
$arrayVar = [1, 2, 3, 4];

echo "\nType of integerVar: " . gettype($integerVar);
echo "\nType of floatVar: " . gettype($floatVar);
echo "\nType of stringVar: " . gettype($stringVar);
echo "\nType of arrayVar: " . gettype($arrayVar);

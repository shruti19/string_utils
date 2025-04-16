# StringUtils provides a StringCalculator class which generates sum of numbers present in a string
# Following use cases are covered:

## 1. For a string with comma separated numbers, return the sum of numbers. If empty string, return 0.

## 2. Allow the Add method to handle an unknown amount of numbers

## 3. Allow the Add method to handle new lines between numbers (instead of commas). new line (\n) and comma if appear adjacent, input is considered invalid.

## 4. Support different delimiters

## 5. Calling Add with a negative number will throw an exception “negatives not allowed” - and the negative that was passed. If there are multiple negatives, show all of them in the exception message.

## 6. Numbers bigger than 1000 should be ignored.

## 7. Delimiters can be of any length with the following format: “//[delimiter]\n” for example: “//[%%%]\n%%%2%%%3” should return 6.

## 8. Allow multiple delimiters like this: “//[delim1][delim2]\n” for example “//[|][%]\n1|2%3” should return 6.

## 9. Make sure you can also handle multiple delimiters with length longer than one char

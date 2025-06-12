/*
Create a program to find the largest among three numbers using if-else. 
*/
void main() {
  int a = 89;
  int b = 899;
  int c = 899;
  if (a >= b && a >= c) {
    print("$a is largest");
  } else if (b >= a && b >= c) {
    print("$b is largest");
  } else {
    print("$c is largest");
  }
}

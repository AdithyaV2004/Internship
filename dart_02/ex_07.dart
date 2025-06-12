/*
Create a program to find the largest among three numbers using Ternary Operator
*/
void main() {
  int a = 98;
  int b = 8;
  int c = 9;
  a >= b
      ? (a >= c ? print("$a is largest") : print("$c is largest"))
      : (b >= c ? print("$b is largest") : print("$c is largest"));
}

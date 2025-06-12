/*
Create a function that returns the factorial of a number. 
*/
void main() {
  int a = 6;
  print(fact(a));
}

int fact(n) {
  int f = 1;
  for (int i = n; i > 0; i--) {
    f = f * i;
  }
  return f;
}

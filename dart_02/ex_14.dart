/*
Write a function that accepts two required parameters (Mark1, and Mark 2) and one
optional parameter (Grace Marks), which optional parameter if provided, adds a bonus to
the sum.
*/
void main() {
  grade(m1: 13, m2: 23, m3: 43);
}

void grade({required int m1, required int m2, int? m3 = 0}) {
  int m = m1 + m2 + m3!;
  print("Marks: $m");
}

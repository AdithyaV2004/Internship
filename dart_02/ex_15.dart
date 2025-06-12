/*
Write an async function that waits for 3 seconds and then prints "Hello after delay"
*/
void main() {
  asfunc();
}

Future<void> asfunc() async {
  await Future.delayed(Duration(seconds: 3));
  print("Hello after delay");
}

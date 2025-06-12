/*
#Create a list of 5 integers and print the list.
#Add an element to the end of a list and print the updated list.
#Insert an element at a specific index in a list and display the result.
#Remove an element from the list and print the updated list.
#Find the length of a list and display it.
#Access an element at a specific index in the list
#Use a forEach method to print all elements of a list.
#Create a list of numbers and find the sum of all elements using a loop.
*/
void main() {
  int sum = 0;
  List<int> myInt = [1, 2, 4, 5];
  print(myInt);
  print("Length: ${myInt.length}");
  print(myInt[1]); //Access element in list by index
  myInt.add(6); //Add element to end of list
  myInt.insert(4, 3); //Add 3 to index 4
  print(myInt);
  myInt.remove(3); //Remove specific element
  print(myInt);
  print("List using forEach");
  for (var i in myInt) {
    //To access individual elements and do any operation
    print(i);
  }
  for (var i in myInt) {
    sum += i;
  }
  print("Sum of all nos using for loop: $sum");
}

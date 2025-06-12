/*
Define a class Vehicle with properties like brand and year. Inherit it in a class Car and
add additional properties like model and fuelType.
*/
class Vehicle {
  String? brand;
  int? year;
  Vehicle({this.brand, this.year}); //Error shows when the constructor is not given
}

class Car extends Vehicle {
  String? model;
  String? fuelType;

  Car({super.brand, super.year, this.model, this.fuelType}); //Assigns the values to parameters in a single line
  void display() {
    print("Brand: ${super.brand} \nModel: $model \nYear: ${super.year} \nFuel:$fuelType");
  }
}

void main() {
  Car c1 = Car(brand: "Toyota", model: "Innova", year: 2015, fuelType: "Diesel");
  c1.display();
}

import 'dart:io';

// Interface
abstract class Vehicle {
  void displayInfo();
}

// Base class
class Car implements Vehicle {
  String brand;
  String model;
  int year;

  Car(this.brand, this.model, this.year);

  @override
  void displayInfo() {
    print("Car: $brand $model, Year: $year");
  }
}

// Derived class
class ElectricCar extends Car {
  int batteryCapacity;

  ElectricCar(String brand, String model, int year, this.batteryCapacity)
      : super(brand, model, year);

  @override
  void displayInfo() {
    super.displayInfo();
    print("Battery Capacity: $batteryCapacity kWh");
  }
}

// Method to read data from file and create Car instance
Car readCarFromFile(String filePath) {
  try {
    File file = File(filePath);
    List<String> lines = file.readAsLinesSync();

    if (lines.length != 3) {
      throw FormatException("Invalid file format");
    }

    String brand = lines[0];
    String model = lines[1];
    int year = int.parse(lines[2]);

    return Car(brand, model, year);
  } catch (e) {
    print("Error reading file: $e");
    return null;
  }
}

// Method demonstrating the use of a loop
void printNumbers(int n) {
  print("Printing numbers from 1 to $n:");
  for (int i = 1; i <= n; i++) {
    print(i);
  }
}

void main() {
  // Creating an instance of ElectricCar
  ElectricCar tesla = ElectricCar("Tesla", "Model S", 2022, 100);

  // Displaying information about the ElectricCar
  tesla.displayInfo();

  // Initializing Car instance with data from a file
  String filePath = "car_data.txt";
  Car carFromFile = readCarFromFile(filePath);
  if (carFromFile != null) {
    print("\nCar details read from file:");
    carFromFile.displayInfo();
  }

  // Demonstrating the use of a loop
  print("\nDemonstrating loop:");
  printNumbers(5);
}

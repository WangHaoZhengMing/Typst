import Foundation

// Protocol for shapes
protocol Shape {
   func area() -> Double
   func perimeter() -> Double
}

// Rectangle class
class Rectangle: Shape {
   let width: Double
   let height: Double

   init(width: Double, height: Double) {
      self.width = width
      self.height = height
   }

   func area() -> Double {
      return width * height
   }

   func perimeter() -> Double {
      return 2 * (width + height)
   }
}

// Circle class
class Circle: Shape {
   let radius: Double

   init(radius: Double) {
      self.radius = radius
   }

   func area() -> Double {
      return Double.pi * radius * radius
   }

   func perimeter() -> Double {
      return 2 * Double.pi * radius
   }
}

// Triangle class
class Triangle: Shape {
   let a: Double
   let b: Double
   let c: Double

   init(a: Double, b: Double, c: Double) {
      self.a = a
      self.b = b
      self.c = c
   }

   func area() -> Double {
      // Using Heron's formula
      let s = (a + b + c) / 2
      return sqrt(s * (s - a) * (s - b) * (s - c))
   }

   func perimeter() -> Double {
      return a + b + c
   }
}

// Student class that implements Shape protocol
class Student: Shape {
   let name: String
   let height: Double  // in meters
   let weight: Double  // in kilograms

   init(name: String, height: Double, weight: Double) {
      self.name = name
      self.height = height
      self.weight = weight
   }

   // Area could represent the student's BMI
   func area() -> Double {
      return weight / (height * height)  // BMI calculation
   }

   // Perimeter could represent the student's height in centimeters
   func perimeter() -> Double {
      return height * 100  // Convert to centimeters
   }
}

// Test class
class ShapeTest {
   static func runTests() {
      // Test Rectangle
      let rectangle = Rectangle(width: 5, height: 3)
      print("Rectangle - Area: \(rectangle.area()), Perimeter: \(rectangle.perimeter())")

      // Test Circle
      let circle = Circle(radius: 4)
      print("Circle - Area: \(circle.area()), Perimeter: \(circle.perimeter())")

      // Test Triangle
      let triangle = Triangle(a: 3, b: 4, c: 5)
      print("Triangle - Area: \(triangle.area()), Perimeter: \(triangle.perimeter())")

      // Test Student
      let student = Student(name: "John", height: 1.75, weight: 70)
      print("Student - BMI: \(student.area()), Height in cm: \(student.perimeter())")

      // Demonstrate polymorphism
      let shapes: [Shape] = [rectangle, circle, triangle, student]
      for (index, shape) in shapes.enumerated() {
         print("Shape \(index + 1) - Area: \(shape.area()), Perimeter: \(shape.perimeter())")
      }
   }
}

// Run the tests
ShapeTest.runTests()

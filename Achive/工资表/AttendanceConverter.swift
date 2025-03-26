import Foundation

struct Person:Decodable {
    let name: String
    let date: String
    let duration: Float
}

// Function to load the attendance data from JSON file
func loadAttendanceData(from file: String) -> [Person]? {
    let url = URL(fileURLWithPath: file)
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let persons = try decoder.decode([Person].self, from: data)
        return persons
    } catch {
        print("Error loading attendance data: \(error)")
        return nil
    }
}

// Function to calculate total work hours per person
func calculateTotalHours(from persons: [Person]) -> [String: Float] {
    var totalHours: [String: Float] = [:]
    for person in persons {
        totalHours[person.name, default: 0] += person.duration
    }
    return totalHours
}

// Example usage
let filePath = "/Users/haominghan/Documents/Typst/attendance.json"
if let attendanceData = loadAttendanceData(from: filePath) {
    let totalHours = calculateTotalHours(from: attendanceData)
    
    // Print individual records
    for person in attendanceData {
        print("\(person.name) worked for \(person.duration) hours on \(person.date)")
    }
    
    // Print total hours per person
    print("\nTotal hours worked per person:")
    for (name, hours) in totalHours {
        print("\(name): \(hours) hours")
    }
}

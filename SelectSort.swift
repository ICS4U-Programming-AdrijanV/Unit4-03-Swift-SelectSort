import Foundation

// Selection sort
func selectionSort(_ array: inout [Int]) {
    // Set n to the length of the array
    let n = array.count

    // Looping for every position in the array.
    for i in 0..<n {
        var minIndex = i
        for j in i+1..<n {
            // Finding the minimum number.
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        if minIndex != i {
            array.swapAt(i, minIndex)
        }
    }
}

// Main function
func readAndSortFile(inputFileName: String, outputFileName: String) {
    do {
        // Create input and output
        let inputURL = URL(fileURLWithPath: inputFileName)
        let outputURL = URL(fileURLWithPath: outputFileName)
        
        // Read the input file
        let input = try String(contentsOf: inputURL)
        
        // Split input into lines
        let lines = input.split(separator: "\n")
        
        var output = ""
        
        for (lineIndex, line) in lines.enumerated() {
            // Split line by spaces
            let numbers = line.split(separator: " ")
            
            var array = [Int]()
            var hasInvalidInput = false
            
            for number in numbers {
                // Convert each number to an integer
                if let num = Int(number) {
                    // Add to array
                    array.append(num)
                } else {
                    // Invalid input
                    hasInvalidInput = true
                    output += "Invalid input at line \(lineIndex + 1)\n"
                    break
                }
            }
            
            if !hasInvalidInput {
                // Call selection sort
                selectionSort(&array)
                
                // Add the sorted array to the string
                output += "\(array)\n"
            }
        }
        
        // Write output to file
        try output.write(to: outputURL, atomically: true, encoding: .utf8)
    } catch {
        // Display error
        print("Error: \(error.localizedDescription)")
    }
}

// Create input/output file
let inputFileName = "input.txt"
let outputFileName = "output.txt"

// Call main function
readAndSortFile(inputFileName: inputFileName, outputFileName: outputFileName)

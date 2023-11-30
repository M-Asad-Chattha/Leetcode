//
//  Problem-1.swift
//  Leetcode
//
//  Created by Muhammad Asad Chattha on 29/11/2023.
//
//  Problem-1: Two Sum
//  Link: https://leetcode.com/problems/two-sum/
//

import SwiftUI

struct Problem_1: View {

    // MARK: - States
    @State private var target: String = ""
    @State private var numberInput: String = ""
    @State private var numbers: [Int] = []
    
    @State private var alertMessage = ""
    @State private var isShowingAlert = false
    
    var body: some View {
        List {
            Section("Target") {
                TextField("Enter Target", text: $target)
                    .keyboardType(.numberPad)
            }
            
            TextField("Enter Number to Add in Array", text: $numberInput)
            
            
            Section("List") {
                ForEach(0..<numbers.count, id: \.self) { num in
                    Text(String(numbers[num]))
                }
            }
        }
        .onSubmit { appendItemToList() }
        .alert("Indices for sum of \(target)", isPresented: $isShowingAlert) {
            Button("ok"){}
        } message: {
            Text(alertMessage)
        }
        
        Button("Find indices") {
            let target = Int(target) ?? 0
            let indices = twoSum(numbers, target)
            alertMessage = "\(indices)"
            isShowingAlert = true
        }
        .buttonStyle(.borderedProminent)
        .disabled(sholdButtonDisable())
    }
}

// MARK: - Helper Methods
extension Problem_1 {
    func appendItemToList() {
        if let number = Int(numberInput) {
            withAnimation {
                numbers.append(number)
                numberInput = ""
            }
        }
    }
    
    func sholdButtonDisable() -> Bool {
        return (numbers.count >= 2 && !target.isEmpty) ?  false : true
    }
}


// MARK: - Problem Solution
extension Problem_1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indexArray = [Int]()
        
    outerLoop: for (i, num) in nums.enumerated() {
        for (j, num_1) in nums.enumerated() {
            if (num + num_1 == target) && (i != j) {
                indexArray.append(i)
                indexArray.append(j)
                break outerLoop
            }
        }
        
    }
        return indexArray
    }
}


#Preview {
    Problem_1()
}

//
//  ContentView.swift
//  ConcurrencyTest
//
//  Created by Nguyen Tran on 8/15/20.
//  Copyright © 2020 Nguyen Tran. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let operaton = CalculatePrimeOperation()
    @State private var calculationDisabled = false
    @State private var messageCalculation: String = "Calculate Primes"
    var body: some View {
        VStack {
            Spacer()
            DatePicker(selection: .constant(Date()), label: { Text("Date")})
            Spacer()
            Button(action: calculatePrimes, label: { Text(messageCalculation)})
                .disabled(calculationDisabled)
            Spacer()
        }
    }
    
    func calculatePrimes() {
        enablePrimeButton(enable: false)
        DispatchQueue.global(qos: .userInitiated).async {
            for number in 0...1_000_000 {
                let isPrimeNumber = self.isPrime(number: number)
                print("\(number) is prime: \(isPrimeNumber)")
            }
            self.enablePrimeButton(enable: true)
        }
    }
    
    func enablePrimeButton(enable: Bool) {
        if enable {
            calculationDisabled = false
            messageCalculation = "Calculate Primes"
        } else {
            calculationDisabled = true
            messageCalculation = "Calculating ..."
            
        }
    }
    
    
    func isPrime(number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        if number <= 3 {
            return true
        }
        var i = 2
        while i * i < number {
            if number % i == 0 {
                return false
            }
            i = i + 2
        }
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

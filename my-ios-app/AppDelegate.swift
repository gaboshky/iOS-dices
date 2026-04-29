import SwiftUI

struct ContentView: View {
    @State private var diceValues: [Int] = Array(repeating: 1, count: 5) // Start with 5 dice
    private let maxDiceCount = 10
    private let minDiceCount = 1

    var body: some View {
        VStack(spacing: 20) {
            Text("🎲 Dice Roller")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Display all dice
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(diceValues.indices, id: \.self) { index in
                        Text("\(diceValues[index])")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 100, height: 100)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                    }
                }
            }
            .padding()

            // Roll Dice Button
            Button(action: rollDice) {
                Text("Roll Dice")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)

            // Add and Remove Dice Buttons
            HStack(spacing: 20) {
                Button(action: addDice) {
                    Text("Add Dice")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(diceValues.count < maxDiceCount ? Color.green : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(diceValues.count >= maxDiceCount) // Disable button if max dice reached

                Button(action: removeDice) {
                    Text("Remove Dice")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(diceValues.count > minDiceCount ? Color.red : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(diceValues.count <= minDiceCount) // Disable button if min dice reached
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }

    func rollDice() {
        diceValues = diceValues.map { _ in Int.random(in: 1...6) }
    }

    func addDice() {
        if diceValues.count < maxDiceCount {
            diceValues.append(Int.random(in: 1...6)) // Add a new dice with a random value
        }
    }

    func removeDice() {
        if diceValues.count > minDiceCount {
            diceValues.removeLast() // Remove the last dice
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
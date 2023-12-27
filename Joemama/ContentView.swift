//
//  ContentView.swift
//  Joemama
//

import SwiftUI

struct ContentView: View {
    @State private var elapsedTime: Int = 0
    @State private var timer: Timer? = nil

    var body: some View {
        VStack {
            Text(formatTime(elapsedTime))
                .font(.largeTitle)
                .padding()

            HStack {
                Button("Start") {
                    self.startTimer()
                }
                .padding()

                Button("Stop") {
                    self.stopTimer()
                }
                .padding()

                Button("Reset") {
                    self.resetTimer()
                }
                .padding()
            }
        }
    }

    private func startTimer() {
        timer?.invalidate() // Stop any existing timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.elapsedTime += 1
        }
    }

    private func stopTimer() {
        timer?.invalidate()
    }

    private func resetTimer() {
        timer?.invalidate()
        elapsedTime = 0
    }

    private func formatTime(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        // Add more components if you want to track hours
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

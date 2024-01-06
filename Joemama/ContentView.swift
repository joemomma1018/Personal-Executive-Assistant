import SwiftUI
import Charts

struct ContentView: View {
    @State private var elapsedTime: Int = 0
    @State private var timer: Timer? = nil
    @State private var progress: Double = 0.0
    @State private var userInput: String = ""
    let totalProgressTime: Double = 60.0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack {
                HStack{
                    Text("Hello")
                    Text("Joemama")
                        .foregroundColor(.purple)
                    
                }
                Text("Insert inspirational shit here")
                VStack {
                    Text("Stopwatch")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(formatTime(elapsedTime))
                        .bold()
                    
                     
                    

                    HStack {
                        Button("Start") { self.startTimer() }                    .padding(2)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(3)
                            .allowsTightening(true)
                        Button("Stop") { self.stopTimer() }                    .padding(2)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(3)
                            .allowsTightening(true)
                        Button("Reset") { self.resetTimer() }                    .padding(2)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(3)
                            .allowsTightening(true)
                        Button("Set") { self.setActivity() } .padding(2)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(3)
                            .allowsTightening(true)
                    }
                    
                    

                }
                .padding(EdgeInsets(top: 20, leading: 80, bottom: 20, trailing: 80))
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 0, y: 2)

                VStack {
                    Text("Before next routine/task")
                        

                    HStack{
                        ProgressView(value: progress, total: totalProgressTime)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                            .frame(width: 60)
                        
                        ProgressView(value: progress, total: totalProgressTime)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                            .frame(width: 60)
                        
                        ProgressView(value: progress, total: totalProgressTime)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                            .frame(width: 60)

                    }


                    Button("Increase Progress") {
                        increaseProgress()
                    }
                }
                .padding(EdgeInsets(top: 20, leading: 80, bottom: 20, trailing: 80))
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 0, y: 2)

                VStack {
                    TextField("Enter something", text: $userInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Text("You entered: \(userInput)")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
            }
            .padding(EdgeInsets(top: 20, leading: 80, bottom: 20, trailing: 80))
        }
    }

    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.elapsedTime += 1
            self.progress = Double(self.elapsedTime)
        }
    }

    private func stopTimer() {
        timer?.invalidate()
    }

    private func resetTimer() {
        timer?.invalidate()
        elapsedTime = 0
        progress = 0
    }
    
    private func setActivity(){
    }

    private func increaseProgress() {
        if progress < totalProgressTime {
            progress += 1.0
        }
    }

    private func formatTime(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct StopwatchButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(3)
            .allowsTightening(true)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

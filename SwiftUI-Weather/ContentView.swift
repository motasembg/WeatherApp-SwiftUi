import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            backgroundGradient(isNight1: isNight)
            VStack {
                cityTitle("Mosocw, Russia")
                
                mainView(isNight: $isNight, viewTitle: isNight ? "moon.stars.fill" : "cloud.sun.fill", tempNum: "5")

                .padding(.bottom, 40)

                HStack(spacing: 3) { 
                    WeatherDayView(dayOfweek: "MON", imageName: "cloud.sun.fill", temperature: -2)
                    WeatherDayView(dayOfweek: "THU", imageName: "cloud.rain.fill", temperature: -5)
                    WeatherDayView(dayOfweek: "WED", imageName: "cloud.snow.fill", temperature: -8)
                    WeatherDayView(dayOfweek: "TUE", imageName: "cloud.snow.fill", temperature: -0)
                }
//                .padding(.horizontal, 20) 
                Spacer()
                ButtonDayTime(isNight: $isNight)
                Spacer()
            }
        }
    }
}
/// Background gradient
private func backgroundGradient(isNight1: Bool) -> some View{
    LinearGradient(gradient: Gradient(colors: isNight1 ? [.black, .gray] : [.blue, Color("lightblue")]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
        .ignoresSafeArea() // fullscreen color new swiftUI
}
/// City title
private func cityTitle(_ name: String) -> some View{
    Text(name)
        .font(.system(size: 32, weight: .medium, design: .default))
        .foregroundStyle(.white)
        .padding(50)
}
/// Button change day time
struct ButtonDayTime: View {
    @Binding var isNight: Bool 
    var body: some View {
        Button {
            isNight.toggle()  
        } label: {
            Text("Change Day Time")
                .frame(width: 280, height: 50)
                .background(Color.white)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
        }
    }
}
/// main view app
struct mainView: View {
    @Binding var isNight: Bool
    var viewTitle: String
    var tempNum: String
    var body: some View {
        VStack {
            Image(systemName: viewTitle)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)

            Text("\(tempNum)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfweek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 8) {
            Text(dayOfweek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundStyle(.white)

            Image(systemName: imageName) 
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40) 

            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
        .padding()
    }
}


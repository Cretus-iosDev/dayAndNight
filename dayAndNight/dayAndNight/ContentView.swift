

import SwiftUI

struct ContentView: View {
    
    @State private var show = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(show ? Color.black : Color.white)
                .ignoresSafeArea()
            example3
            
        }
        .onTapGesture {
            show.toggle()
        }
        .animation(.spring(),value: show)
       
    }
    
    private var scene: some View {
        VStack {
            ZStack {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.radialGradient(colors: [.orange, .yellow], center: .center, startRadius: 0, endRadius: 70))
                    .position(show ? .init(x: 150, y: -1000) :
                            .init(x:150, y: 250))
                
                
                Image(systemName: "moon.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                    .position(show ? .init(x: 250, y: 250) :
                            .init(x:250, y: -1000))
            }
            
            Spacer()
            
            VStack{
                Rectangle()
                    .fill(show ? Color.gray : Color.green)
                Rectangle()
                    .stroke(style:  StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 0.5)
                    .foregroundStyle(show ? Color.white : Color.black)
                
                Rectangle()
                    .fill(show ? Color.gray : Color.green)
            }
            .frame(height: 100)
        }
    }
    
    private var example1: some View {
        scene
            .animation(.spring(), value: show)
    }
    private var example2: some View {
        scene
            .animation(.spring(dampingFraction: 0.5), value: show)
    }
    private var example3: some View {
        scene
            .animation(.spring(response: 2, dampingFraction: 0.5), value: show)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

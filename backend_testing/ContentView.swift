//
//  ContentView.swift
//  backend_testing
//
//  Created by Clarence Jiang on 10/18/21.
//

import SwiftUI

struct ContentView: View {
    @State var events = [Event]()
    var body: some View {
        ForEach(events, id: \.self){item in
            HStack {
                Image(systemName:"eventnote").foregroundColor(.green)
                Text(item.event_name)
                Spacer()
                Text("\(item.event_type)") //I'll just use price here for example
            }
        }.onAppear(perform: loadEvent)
    }
    
    func loadEvent(){
        guard let url = URL(string:
            "http://127.0.0.1:8000/events/") else{
            print("api is down")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Basic Y2xhcmVuY2U6amlhbmd5dW5mYW4xMjM=", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request){data, response, error in
            if let data = data {
                if let response = try?
                    JSONDecoder().decode([Event].self, from: data){
                    DispatchQueue.main.async {
                        self.events = response
                    }
                    return
                }
            }
        }.resume()
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

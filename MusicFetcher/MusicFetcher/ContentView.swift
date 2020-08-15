//
//  ContentView.swift
//  MusicFetcher
//
//  Created by Nguyen Tran on 8/16/20.
//  Copyright © 2020 Nguyen Tran. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, World!")
            Spacer()
            Button(action: fetcher, label: { Text("Fetching data music")})
            Spacer()
        }
    }
    
    func fetcher() {
        
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=cohen") else {
            fatalError()
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                (200..<300).contains(httpResponse.statusCode),
                let data = data else {
                    return
            }
            let decoder = JSONDecoder()
            guard let mediaResponse = try? decoder.decode(MediaResponse.self, from: data) else {
                return
            }
            
            print(mediaResponse.results.first)
        }.resume()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

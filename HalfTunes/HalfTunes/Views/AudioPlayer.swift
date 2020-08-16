//
//  AudioPlayer.swift
//  HalfTunes
//
//  Created by Nguyen Tran on 8/16/20.
//  Copyright © 2020 Nguyen Tran. All rights reserved.
//

import SwiftUI
import AVKit

struct AudioPlayer: UIViewControllerRepresentable {
    
    let songUrl: URL
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
      let player = AVPlayer(url: songUrl)
      let playerViewController = AVPlayerViewController()
      playerViewController.player = player
      playerViewController.entersFullScreenWhenPlaybackBegins = true
      return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
      
        // TODO: - update ui view controller
    }
}

struct AudioPlayer_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, audio player")
    }
}

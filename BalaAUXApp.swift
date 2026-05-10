import SwiftUI
import AVFoundation

@main
struct BalaAUXApp: App {

    @StateObject private var player  = PlayerViewModel()
    @StateObject private var library = MusicLibrary.shared
    @StateObject private var hfp     = HFPManager.shared
    @StateObject private var audio   = AudioSessionManager.shared
    @StateObject private var callKit = CallKitManager.shared

    init() {
        AudioSessionManager.shared.configureForMusic()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(player)
                .environmentObject(library)
                .environmentObject(hfp)
                .environmentObject(audio)
                .environmentObject(callKit)
                .onAppear {
                    player.setupRemoteControls()
                    library.load()
                }
        }
    }
}

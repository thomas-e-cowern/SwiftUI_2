//
//  ContentView.swift
//  Shared
//
//  Created by Thomas Cowern New on 1/15/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        
        Home()
            .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var record = false
    // Instance for recordr
    @State var session: AVAudioSession!
    @State var recorder: AVAudioRecorder!
    // Alert for microphone use
    @State var alert = false
    // Get audio recordings
    @State var audioRecordings: [URL] = []
    
    var audioPlayer : AVAudioPlayer?
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                List (self.audioRecordings,id: \.self) { i in
                    
                    // Printing file name
                    Text(i.relativeString)
                    
                }
                
                Button (action: {
                    
                    do {
                        
                        if self.record {
                         
                            self.recorder.stop()
                            self.record.toggle()
                            // Updating list of recordings
                            self.getAudioRecordings()
                            return
                            
                        }
                            
                            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                            
                        let fileName = url.appendingPathComponent("myRcd\(self.audioRecordings.count + 1).m4a")
                            
                            let settings = [
                            
                                AVFormatIDKey : Int(kAudioFormatMPEG4AAC),
                                AVSampleRateKey : 2000,
                                AVNumberOfChannelsKey : 1,
                                AVEncoderAudioQualityKey : AVAudioQuality.high.rawValue
                            ]
                            
                            self.recorder = try AVAudioRecorder(url: fileName, settings: settings)
                            self.recorder.record()
                            self.record.toggle()
                            
                        
                        
                    }
                    
                    catch {
                        
                        print(error.localizedDescription)
                        
                    }
                    
                }) {
                    
                    ZStack {
                        
                        Circle()
                            .fill(Color.green)
                            .frame(width: 70, height: 70)
                        
                        if self.record {
                            
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 70, height: 70)
                            
                        }
                    }
                }
            }
            .navigationBarTitle("Voice Recorder")
        }
        .alert(isPresented: self.$alert, content: {
            Alert(title: Text("Error"), message: Text("We need access to your microphone to record messages"))
        })
        .onAppear {
            
            do {
                // Initialize
                self.session = AVAudioSession.sharedInstance()
                try self.session.setCategory(.playAndRecord)
                
                // Requestiong permission for microphone use
                self.session.requestRecordPermission { (status) in
                    
                    if !status {
                        
                        // error alert
                        self.alert.toggle()
                        
                    } else {
                        
                        // permission given.
                        self.getAudioRecordings()
                        
                    }
                }
            }
            
            catch {
                print("Error:", error.localizedDescription)
            }
        }
    }
    
    func getAudioRecordings () {
        
        do {
            
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            // Fetching all data
            let result = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .producesRelativePathURLs)
            
            self.audioRecordings.removeAll()
            
            for  i in result {
                
                self.audioRecordings.append(i)
                print(self.audioRecordings)
            
            }
            
        } catch {
            
            print(error.localizedDescription)
            
        }
    }
}

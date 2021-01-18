//
//  RecordingList.swift
//  AudioRecorderPlayer
//
//  Created by Thomas Cowern New on 1/16/21.
//

import SwiftUI

struct RecordingList: View {
    
    @ObservedObject var  audioRecorder: AudioRecorder
    
    var body: some View {
        List {
            ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
                RecordingRow(audioURL: recording.fileUrl)
            }
            .onDelete(perform: delete)
        }
    }
    
    func delete(at offsets: IndexSet) {
            
            var urlsToDelete = [URL]()
            for index in offsets {
                urlsToDelete.append(audioRecorder.recordings[index].fileUrl)
            }
            audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
        }
}

struct RecordingRow: View {
    
    var audioURL: URL
    
    @ObservedObject var audioPlayer = AudioPlayer()
    
    var body: some View {
        HStack {
            Text("\(audioURL.lastPathComponent)")
            Spacer()
            if audioPlayer.isPlaying == false {
                Button(action: {
                    self.audioPlayer.startPlayback(audio: self.audioURL)
                }) {
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                }
            } else {
                Button(action: {
                    self.audioPlayer.stopPlayback()
                }) {
                    Image(systemName: "stop.fill")
                        .imageScale(.large)
                }
            }
        }
    }
}

struct RecordingList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingList(audioRecorder: AudioRecorder())
    }
}

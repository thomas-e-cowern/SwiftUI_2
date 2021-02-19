//
//  HypedListWidget.swift
//  HypedListWidget
//
//  Created by Thomas Cowern New on 2/6/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> HypedEventEntry {
        
        let placeholderHypedEvent = HypedEvent()
        placeholderHypedEvent.color = Color.green
        placeholderHypedEvent.title = "Loading..."
        
        return HypedEventEntry(date: Date(), hypedEvent: placeholderHypedEvent)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (HypedEventEntry) -> ()) {
        
        let upcoming = DataController.shared.getUpcomingForWidget()
        
        var entry = HypedEventEntry(date: Date(), hypedEvent: upcoming.randomElement())

        
        if upcoming.count > 0 {
            entry = HypedEventEntry(date: Date(), hypedEvent: upcoming.randomElement())
        }
        
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [HypedEventEntry] = []
        
        let upcoming = DataController.shared.getUpcomingForWidget()
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< upcoming.count {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = HypedEventEntry(date: entryDate, hypedEvent: upcoming[hourOffset])
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct HypedEventEntry: TimelineEntry {
    let date: Date
    let hypedEvent: HypedEvent?
}

struct HypedListWidgetEntryView : View {
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var entry: Provider.Entry
    
    var body: some View {
        
        GeometryReader { geometry in
            
            if let hypedEvent = entry.hypedEvent {
                
                ZStack {
                    Color(UIColor(hypedEvent.color))
                    if hypedEvent.image() != nil {
                        hypedEvent.image()!
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    } else {
                        hypedEvent.color
                    }
                    Text(hypedEvent.title)
                        .padding(5)
                        .foregroundColor(hypedEvent.color)
                        .background(Color.black)
                        .multilineTextAlignment(.center)
                        .cornerRadius(4)
                        .font(fontSize())
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text(hypedEvent.timeFromNow())
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 15))
                                .foregroundColor(hypedEvent.color)
                                .background(Color.black)
                                .cornerRadius(4)
                                .font(fontSize())
                        }
                    }
                    
                    
                }
            } else {
                Text("No events upcoming. Tap to add one...")
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    func fontSize () -> Font {
        switch widgetFamily {
        case .systemSmall:
            return .body
        case .systemMedium:
            return .title3
        case .systemLarge:
            return .title
        @unknown default:
            return .body
        }
    }
}

@main
struct HypedListWidget: Widget {
    let kind: String = "HypedListWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            HypedListWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("See your upcoming events.")
    }
}

struct HypedListWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HypedListWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            HypedListWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            HypedListWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
            
            HypedListWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            HypedListWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            HypedListWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
            
            HypedListWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            HypedListWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            HypedListWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
        
    }
}

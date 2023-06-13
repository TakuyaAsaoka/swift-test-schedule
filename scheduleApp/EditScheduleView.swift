//
//  EditScheduleView.swift
//  scheduleApp
//
//  Created by AsaokaTakuya on 2023/06/13.
//

import SwiftUI

struct EditScheduleView: View {
  @Environment(\.managedObjectContext) private var viewContext
  @State private var title: String
  @State private var content: String
  private var schedule: Schedule
  
  init(schedule: Schedule) {
    self.schedule =  schedule
    self.title = schedule.title
    self.content = schedule.content
  }
  
  var body: some View {
    VStack {
      TextField("タイトル", text: $title)
        .font(.title)
      TextEditor(text: $content)
        .font(.body)
      Spacer()
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: {saveSchedule()}) {
          Text("保存")
        }
      }
    }
  }
  
  private func saveSchedule() {
    schedule.title = title
    schedule.content = content
    schedule.createdAt = Date()
    
    try? viewContext.save()
  }
}

struct EditScheduleView_Previews: PreviewProvider {
  static var previews: some View {
    EditScheduleView(schedule: Schedule())
  }
}

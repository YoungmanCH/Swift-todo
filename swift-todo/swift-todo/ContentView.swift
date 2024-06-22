//
//  ContentView.swift
//  swift-todo
//
//  Created by Youngman on 2024/06/22.
//

import SwiftUI

struct ContentView: View {
    @State var taskData = [(title: "Running", completed: false),
                           (title: "Water the flowers", completed: false),
                           (title: "Room-cleaning", completed: false),
                           (title: "Read a book", completed: false)]
    
    var body: some View {
        NavigationStack {
            List(0..<taskData.count, id: \.self) { index in
                Button {
                    //.toggle()は、 taskData[index].completed = !taskData[index].completed　と同じ性質を持つ。
                    taskData[index].completed.toggle()
                } label: {
                    HStack {
                        Image(systemName: taskData[index].completed ? "checkmark.circle.fill" : "circle")
                        Text(taskData[index].title)
                    }
                    // .primaryにすることで、ダークモードの場合は白、デフォルトモードの場合は、黒になる。
                    .foregroundColor(.primary)
                }
            }
            .navigationTitle("TODO List")
        }
    }
}

#Preview {
    ContentView()
}

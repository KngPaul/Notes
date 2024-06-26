//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Paul Onawola on 25/06/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    
                    Button {
                        guard text.isEmpty == false else { return }
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        save()
                        text = ""
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                    .fixedSize()
                    .buttonStyle(.plain)
                    .foregroundStyle(.accent)
                    .font(.system(size: 42, weight: .semibold))
                }
                
                Spacer()
                
                if notes.count > 0 {
                    List {
                        ForEach(notes) { note in
                            NavigationLink {
                                DetailView(note: note, count: notes.count, index: notes.firstIndex { element in
                                    element.id == note.id
                                }!)
                            } label: {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundStyle(.accent)
                                    Text(note.text)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                } else {
                    Spacer()
                    
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.secondary)
                        .opacity(0.25)
                        .padding(25)
                    
                    Spacer()
                }
            }
            .navigationTitle("Notes")
            .onAppear {
                load()
            }
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Saving notes failed.")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                
            }
        }
    }
    
    func delete(offset: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offset)
            save()
        }
    }
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}

#Preview {
    ContentView()
}

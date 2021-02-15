//
//  ContentView.swift
//  OuZuo
//
//  Created by Daniel Watson on 15/02/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: ToDo.entity(), sortDescriptors: [])
    var toDos: FetchedResults<ToDo>
    @State var presentSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink(destination: DetailView(obj: toDo)) {
                        RowView(obj: toDo)
                    }
                }.onDelete(perform: delete)
            }
            .listStyle(InsetListStyle())
            .padding()
            .sheet(isPresented: $presentSheet, content: {
                AddNewSheet()
            })
            .navigationBarItems(
                leading: Text("OuZuo"),
                trailing: Image(systemName: "plus")
                    .onTapGesture {
                        self.presentSheet = true
                    })
                }
            }
    func delete(indexSet: IndexSet) {
        for index in indexSet {
            let obj = toDos[index]
            self.moc.delete(obj)
            try? self.moc.save()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        let moc = pC.viewContext
//        ContentView()
//    }
//}

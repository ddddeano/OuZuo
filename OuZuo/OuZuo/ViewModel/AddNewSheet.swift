//
//  AddNewSheet.swift
//  OuZuo
//
//  Created by Daniel Watson on 15/02/2021.
//

import SwiftUI
import CoreData

struct AddNewSheet: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var pm
    @State var name = ""
    var body: some View {
        VStack {
            TextField("Add New OuZuo", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Image(systemName: "plus")
                .onTapGesture {
                    save()
                    self.pm.wrappedValue.dismiss()
            }
        }
    }
    func save() {
        let entity = ToDo(context: self.moc)
        entity.name = self.name
        try? self.moc.save()
    }
}

struct AddNewSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddNewSheet()
    }
}

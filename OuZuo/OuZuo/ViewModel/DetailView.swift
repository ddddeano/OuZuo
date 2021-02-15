//
//  DetailView.swift
//  OuZuo
//
//  Created by Daniel Watson on 15/02/2021.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var pm
    @ObservedObject var obj: ToDo
    
    var body: some View {
        VStack {
            TextField("\(obj.name)", text: $obj.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Image(systemName: "pencil")
                .onTapGesture {
                    upDate()
                    self.pm.wrappedValue.dismiss()
                }
        }
    }
    func upDate() {
        obj.setValue(self.obj.name, forKey: "name")
        try? self.moc.save()
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}

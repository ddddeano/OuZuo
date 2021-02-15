//
//  RowView.swift
//  OuZuo
//
//  Created by Daniel Watson on 15/02/2021.
//

import SwiftUI

struct RowView: View {
    @ObservedObject var obj: ToDo
    var body: some View {
        Text(obj.name)
    }
}

//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView()
//    }
//}

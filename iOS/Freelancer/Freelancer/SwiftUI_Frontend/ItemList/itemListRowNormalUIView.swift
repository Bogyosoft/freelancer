//
//  itemListRowNormalUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 12. 05..
//

import SwiftUI

struct itemListRowNormalUIView: View {
    
    //var item: ItemData
    //let namespace: Namespace.ID
    
    var body: some View {
            GeometryReader { g in
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            //blurTags(tags: p.postType, namespace: namespace)
                            Spacer()
                            Text("item.destination")
                                .foregroundColor(.blue)
                            Spacer()
                            HStack {
                                Text("(100)")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                                    //.matchedGeometryEffect(id: "ratingNum", in: namespace)
                            }
                        }.padding(.leading)
        
                    }.background(Color.red)
                }
            }
    }
}

struct itemListRowNormalUIView_Previews: PreviewProvider {
    static var previews: some View {
        itemListRowNormalUIView()
    }
}



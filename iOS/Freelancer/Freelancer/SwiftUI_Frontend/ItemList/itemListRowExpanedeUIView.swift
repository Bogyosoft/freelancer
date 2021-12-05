//
//  itemListRowExpanedeUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 12. 05..
//

import SwiftUI

struct itemListRowExpanedeUIView: View {
    
    //var p: ListData
    let namespace: Namespace.ID
    
    var body: some View {
        
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            //blurTags(tags: p.postType, namespace: namespace)
                            Spacer()
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color.white)
                                //.matchedGeometryEffect(id: "ellipsis", in: namespace)
                        }
                        
                        Spacer()
                        Text("p.title")
                            //.foregroundColor(Color.textColor)
                            //.matchedGeometryEffect(id: "title", in: namespace)
                        Spacer()
                        HStack {
                            //Stars(star: p.stars)
                                //.matchedGeometryEffect(id: "stars", in: namespace)
                            Text("(100)")
                                .font(.caption2)
                                .foregroundColor(.gray)
                                //.matchedGeometryEffect(id: "ratingNum", in: namespace)
                        }
                    }
                    Spacer()
                    VStack {
                        Spacer()
                    }
                }
            }
    }
}

/*struct itemListRowExpanedeUIView_Previews: PreviewProvider {
    static var previews: some View {
        itemListRowExpanedeUIView()
    }
}*/



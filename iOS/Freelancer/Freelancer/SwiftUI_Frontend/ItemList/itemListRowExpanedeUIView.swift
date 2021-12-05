//
//  itemListRowExpanedeUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 12. 05..
//

import SwiftUI

struct itemListRowExpanedeUIView: View {
    
    var item: ItemData
    //var p: ListData
    //let namespace: Namespace.ID
    
    var body: some View {
        GeometryReader { g in
            VStack(alignment: .trailing) {
                HStack{
                    //Spacer()
                    VStack
                    {
                        Image("box")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .cornerRadius(10)
                        Spacer()
                    }
                    
                        //.matchedGeometryEffect(id: "image", in: namespace)
                    VStack(alignment: .leading)
                    {
                        Spacer()
                        HStack
                        {
                            Image(systemName: "mappin").foregroundColor(Color.yellowCustom)
                            Text(item.destination)
                                .foregroundColor(Color.yellowCustom)
                        }
                        
                        Spacer()
                        HStack
                        {
                            Image(systemName: "tag").foregroundColor(Color.yellowCustom)
                            Text(item.propertis)
                                .foregroundColor(Color.yellowCustom)
                        }
                        Spacer()
                        HStack
                        {
                            Image(systemName: "person").foregroundColor(Color.yellowCustom)
                            Text(item.source.ownerName)
                                .foregroundColor(Color.yellowCustom)
                        }
                        Spacer()
                    }.padding(.leading)
                    
                    //
                        
                    Spacer()
                }
                
                HStack
                {
                    Spacer()
                    Button(action: {
                    }) {
                        Text("Munka elfogadása")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            .background(Color.yellowCustom)
                            .clipShape(Capsule())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                            
                    }//.offset(y: 25)
                    //.opacity(self.index == 0 ? 1: 0)
                    .buttonStyle(GrowingButtonRegistration())
                    Spacer()
                }
                Spacer()
                Divider().background(Color.white.opacity(0.5))
            }
        }//.border(Color.yellowCustom)
        
    }
}

struct itemListRowExpanedeUIView_Previews: PreviewProvider {
    static var previews: some View {
        itemListRowExpanedeUIView(item: ItemData(inID: 0, inDestination: "nincs", inProperties: "nincs", inStatus: "nincs", inSource: SourceData(inputID: 0, inputName: "nincs", inputLocation: "nincs")))
    }
}



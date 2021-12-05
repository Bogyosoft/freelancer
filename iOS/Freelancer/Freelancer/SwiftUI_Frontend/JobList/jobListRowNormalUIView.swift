//
//  jobListRowNormalUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 12. 05..
//

import SwiftUI

struct jobListRowNormalUIView: View {
    var job: JobData
    //let namespace: Namespace.ID
    
    var body: some View {
            GeometryReader { g in
                VStack(alignment: .leading) {
                    HStack {
                        Image("workerhat")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .cornerRadius(10)
                            //.matchedGeometryEffect(id: "image", in: namespace)
                        VStack(alignment: .leading)
                        {
                            Spacer()
                            HStack
                            {
                                Image(systemName: "mappin").foregroundColor(Color.yellowCustom)
                                Text(job.item.destination)
                                    .foregroundColor(Color.yellowCustom)
                            }
                            
                            Spacer()
                            HStack
                            {
                                Image(systemName: "tag").foregroundColor(Color.yellowCustom)
                                Text(job.item.propertis)
                                    .foregroundColor(Color.yellowCustom)
                            }
                            Spacer()
                        }.padding(.leading)
                        
                        //
        
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                
            }
    }
}

struct jobListRowNormalUIView_Previews: PreviewProvider {
    static var previews: some View {
        jobListRowNormalUIView(job: JobData(inID: 0, inFreelancer: "ugysekell", inItem: ItemData(inID: 0, inDestination: "nincs", inProperties: "nincs", inStatus: "nincs", inSource: SourceData(inputID: 0, inputName: "nincs", inputLocation: "nincs"))))
    }
}

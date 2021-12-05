//
//  jobListRowExpandedUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 12. 05..
//
//

import SwiftUI

struct jobListRowExpandedUIView: View {
    
    var job: JobData
    
    var body: some View {
        GeometryReader { g in
            VStack(alignment: .trailing) {
                HStack{
                    //Spacer()
                    VStack
                    {
                        Image("workerhat")
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
                        HStack
                        {
                            Image(systemName: "person").foregroundColor(Color.yellowCustom)
                            Text(job.item.source.ownerName)
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
                        
                        //PUT
                        let job = Job(inData: job, itemIn: Item(inData: ItemData(inID: 0, inDestination: "", inProperties: "", inStatus: "", inSource: SourceData(inputID: 0, inputName: "", inputLocation: ""))))
                        
                        job.jobHandler.put(input: job) {valasz in
                            
                            print("KESZ A PUT")
                            
                            if valasz
                            {
                                UserSettingsWorker.shared.jobPutSuccess.toggle()
                                UserSettingsWorker.shared.jobPutID = job.data.id
                            }
                            else
                            {
                                
                            }
                            
                        }
                        
                    }) {
                        Text("Visszaadás")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .font(.system(size: 12))
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            .background(Color.yellowCustom)
                            .clipShape(Capsule())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                            
                    }//.offset(y: 25)
                    //.opacity(self.index == 0 ? 1: 0)
                    .buttonStyle(GrowingButtonRegistration())
                    Spacer()
                    Button(action: {
                        
                        //DELETE
                        let job = Job(inData: job, itemIn: Item(inData: ItemData(inID: 0, inDestination: "", inProperties: "", inStatus: "", inSource: SourceData(inputID: 0, inputName: "", inputLocation: ""))))
                        
                        job.jobHandler.delete(input: job) {valasz in
                            
                            print("KESZ A DELETE")
                            
                            if valasz
                            {
                                UserSettingsWorker.shared.jobDeleteSuccess.toggle()
                                UserSettingsWorker.shared.jobDeleteID = job.data.id
                            }
                            else
                            {
                                
                            }
                            
                        }
                        
                    }) {
                        Text("Kiszállítva")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .font(.system(size: 12))
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

struct jobListRowExpandedUIView_Previews: PreviewProvider {
    static var previews: some View {
        jobListRowExpandedUIView(job: JobData(inID: 0, inFreelancer: "ugysekell", inItem: ItemData(inID: 0, inDestination: "nincs", inProperties: "nincs", inStatus: "nincs", inSource: SourceData(inputID: 0, inputName: "nincs", inputLocation: "nincs"))))
    }
}

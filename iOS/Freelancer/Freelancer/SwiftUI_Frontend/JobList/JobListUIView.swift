//
//  JobListUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 18..
//

import SwiftUI

struct JobListUIView: View {
    
    @State var jobsUI: Array<JobData> = Array<JobData>()
    @State var spinner: Bool = false
    
    var body: some View {
        VStack
        {
            HStack
            {
                VStack(alignment: .leading, spacing: 10)
                {
                    Text("Munkáim")
                      .font(.largeTitle)
                      .fontWeight(.heavy)
                      .foregroundColor(.black)
                    Capsule()
                        .fill(Color.yellowCustom)
                        .frame(width: 100, height: 5)
                }
                
            }
            .padding(.bottom, 15)
            .padding(.horizontal)
            .padding(.top, 40)
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      alignment: .topLeading
                    )
            JobList()
        }
    }
}

struct JobDataRowView: View {
    var job: JobData

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(job.freelancer)
                .foregroundColor(.primary)
                .font(.headline)
            HStack(spacing: 3) {
                Label(job.item.destination, systemImage: "car")
            }
            .foregroundColor(.secondary)
            .font(.subheadline)
        }
    }
}

struct JobList: View {
    @ObservedObject var settings = UserSettingsWorker.shared
    @State var jobsUI: Array<JobData> = Array<JobData>()
    @State var spinner: Bool = false
    
    
    var body: some View {
        
        ZStack
        {
            if !spinner
            {
                VStack
                {
                    ProgressView()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            else
            {
                if !jobsUI.isEmpty
                {
                    ScrollView {
                        VStack {
                            ForEach(jobsUI) { job in
                                
                                
                                CardDetectorForJob(job: job, position: .small)
                                
                                
                            }
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            
            if settings.jobPutSuccess
            {
                
                SuccessCardUIView().onAppear(perform: {
                    Haptics.shared.notify(.success)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        withAnimation()
                        {
                            UserSettingsWorker.shared.jobPutSuccess.toggle()
                             
                        }
                    })
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                        withAnimation()
                        {
                            deleteItem()
                             
                        }
                    })
                    
                    
                }).opacity(0.9).transition(.opacity)
            }
            
            if settings.jobDeleteSuccess
            {
                
                SuccessCardUIView().onAppear(perform: {
                    Haptics.shared.notify(.success)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        withAnimation()
                        {
                            UserSettingsWorker.shared.jobDeleteSuccess.toggle()
                             
                        }
                    })
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                        withAnimation()
                        {
                            deleteItemDelete()
                             
                        }
                    })
                    
                    
                }).opacity(0.9).transition(.opacity)
            }
           
        }.onAppear
        {
            
            print("LEKEREEEES-JOB")
            let lekertAdatok = Item(inData: ItemData(inID: 0, inDestination: "nil", inProperties: "nil", inStatus: "nil", inSource: SourceData(inputID: -1, inputName: "nil", inputLocation: "nil")))
            
            let jobLekeres = Job(inData: JobData(inID: 0, inFreelancer: "nil", inItem: ItemData(inID: 0, inDestination: "nil", inProperties: "nil", inStatus: "nil", inSource: SourceData(inputID: -1, inputName: "nil", inputLocation: "nil"))), itemIn: lekertAdatok)
            
            
            
            jobLekeres.jobHandler.get(input: jobLekeres, completion: {(valaszArray: Array<JobData>, valaszKesz: Bool)->Void in
                
                print("VISSZA A UI-ra")
                //print(valaszArray[0].propertis)
                
                self.jobsUI = valaszArray
                self.spinner = valaszKesz

                
            })
            
        }
        
        
    }

    func deleteItem() {
        var i = 0
        var stepper = 0
        for job in self.jobsUI{
            if job.id == UserSettingsWorker.shared.jobPutID
            {
                i = stepper
            }
            stepper += 1
        }
        let indexSet = IndexSet(integer: i)
        self.jobsUI.remove(atOffsets: indexSet)
    }
    
    func deleteItemDelete() {
        var i = 0
        var stepper = 0
        for job in self.jobsUI{
            if job.id == UserSettingsWorker.shared.jobDeleteID
            {
                i = stepper
            }
            stepper += 1
        }
        let indexSet = IndexSet(integer: i)
        self.jobsUI.remove(atOffsets: indexSet)
    }
}

struct CardDetectorForJob: View {
    
    var job: JobData
    @State var position: CardPosition
    @Namespace var namespace
    var body: some View {
        
        
            Group {
                switch position {
                case .small:
                    jobListRowNormalUIView(job: job)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(BlurView(style: .regular))
                    .cornerRadius(10)
                    .padding(.vertical,6)
                    .onTapGesture {
                        withAnimation {
                            position = .big
                        }
                    }
                    .padding(.horizontal)
                case .big:
                    jobListRowExpandedUIView(job: job)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 270)
                    .background(BlurView(style: .regular))
                    .cornerRadius(10)
                    .padding(.vertical,6)
                    .onTapGesture {
                        withAnimation {
                            position = .small
                        }
                    }
                    .padding(.horizontal)
                }
            }.cornerRadius(10)
        
            
    }
}


struct JobListUIView_Previews: PreviewProvider {
    static var previews: some View {
        JobListUIView()
    }
}

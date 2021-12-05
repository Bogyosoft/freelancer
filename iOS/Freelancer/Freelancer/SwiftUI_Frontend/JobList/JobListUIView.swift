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
            Text("Munkák").font(.largeTitle)
            
            if !spinner
            {
                ProgressView()
            }
            else
            {
                if !jobsUI.isEmpty
                {
                    List
                    {
                        ForEach(jobsUI)
                        { jobElem in
                            JobDataRowView(job: jobElem)
                            //Text(item.destination)
                        }
                    }
                }
                
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

struct JobListUIView_Previews: PreviewProvider {
    static var previews: some View {
        JobListUIView()
    }
}

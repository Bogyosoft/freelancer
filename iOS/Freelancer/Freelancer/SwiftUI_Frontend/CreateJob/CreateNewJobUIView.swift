//
//  CreateNewJobUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 18..
//

import SwiftUI

struct CreateNewJobUIView: View {
    var body: some View {
        VStack
        {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.onAppear()
        {
            let sourceData = SourceData(inputID: 9, inputName: String(describing: UserSettingsWorker.shared.values["userName"]!), inputLocation: "locationBe")
            
            let itemData = ItemData(inID: 9, inDestination: "", inProperties: "", inStatus: "", inSource: sourceData)
            let jobData = JobData(inID: 0, inFreelancer: "000000", inItem: itemData)
            let job = Job(inData: jobData)
            
            job.jobHandler.post(input: job, completion: {(valaszBefejezettseg: Bool)->Void in
                
                print("VALASZ FOR CREATEJOB: \(valaszBefejezettseg)")
            })
            
        }
        
    }
}

struct CreateNewJobUIView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewJobUIView()
    }
}

//
//  CertificateRow.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 23..
//
//


import SwiftUI

struct CertificateRow: View {

    var certificates = certificateData
    @State var jobsUI: Array<JobData> = Array<JobData>()
    @ObservedObject var settings = UserSettingsWorker.shared
    
   var body: some View {
      VStack(alignment: .leading) {
         Text("Folyamatban")
            .font(.system(size: 20))
            .fontWeight(.heavy)
            .padding(.leading, 30)

         ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
               ForEach(jobsUI) { job in
                  CertificateView(job: job)
               }
            }
            .padding(20)
            .padding(.leading, 10)
         }
          
          if settings.jobPutSuccess
          {
              SuccessCardUIView().onAppear(perform: {
                  DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                      withAnimation()
                      {
                          print("UJRATOLTES")
                          askJobData() 
                      }
                  })
                  
                  
                  
                  
              }).opacity(0.9).transition(.opacity)
          }
          
          if settings.jobAcceptSuccess
          {
              SuccessCardUIView().onAppear(perform: {
                  DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                      withAnimation()
                      {
                          print("UJRATOLTES")
                          askJobData()
                           
                      }
                  })
                  
                  
                  
                  
              }).opacity(0.9).transition(.opacity)
          }
          
          
      }.onAppear
       {
           print("FOLYAMATBAN LEVO MUNKA")
           askJobData()
       }
   }
    
    func askJobData()
    {
        print("HOMELIS:LEKEREEEES-JOB")
        let lekertAdatok = Item(inData: ItemData(inID: 0, inDestination: "nil", inProperties: "nil", inStatus: "nil", inSource: SourceData(inputID: -1, inputName: "nil", inputLocation: "nil")))
        
        let jobLekeres = Job(inData: JobData(inID: 0, inFreelancer: "nil", inItem: ItemData(inID: 0, inDestination: "nil", inProperties: "nil", inStatus: "nil", inSource: SourceData(inputID: -1, inputName: "nil", inputLocation: "nil"))), itemIn: lekertAdatok)
        
        
        
        jobLekeres.jobHandler.get(input: jobLekeres, completion: {(valaszArray: Array<JobData>, valaszKesz: Bool)->Void in
            
            print("VISSZA A UI-ra")
            //print(valaszArray[0].propertis)
            
            self.jobsUI = valaszArray
            //self.spinner = valaszKesz

            
        })
    }
}

#if DEBUG
struct CertificateRow_Previews: PreviewProvider {
   static var previews: some View {
      CertificateRow()
   }
}
#endif

struct Certificate: Identifiable {
   var id = UUID()
   var title: String
   //var image: String
   var width: Int
   var height: Int
}

let certificateData = [
   Certificate(title: "Folymatban lévő munka"/*, image: "Certificate1"*/, width: 230, height: 150),
   Certificate(title: "Folymatban lévő munka"/*, image: "Certificate1"*/, width: 230, height: 150),
   Certificate(title: "Folymatban lévő munka"/*, image: "Certificate1"*/, width: 230, height: 150),
   Certificate(title: "Folymatban lévő munka"/*, image: "Certificate1"*/, width: 230, height: 150)
]


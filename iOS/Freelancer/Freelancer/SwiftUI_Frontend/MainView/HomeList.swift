//
//  HomeList.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 23..
//
//

import SwiftUI

struct HomeList: View {

    //var courses = coursesData
    @State var jobsUI: Array<JobData> = Array<JobData>()
    @State var showContent = false
    @State var userUI = UserData(inUser: "", inPass: "", inRole: "", inScore: 0)
    @ObservedObject var settings = UserSettingsWorker.shared

   var body: some View {
      ScrollView {
         VStack {
            HStack {
               VStack(alignment: .leading) {
                   Text(String(describing: UserSettingsWorker.shared.loadUserSettings(key: "userName") as! String))
                     .font(.largeTitle)
                     .fontWeight(.heavy)

                   Text("\(userUI.score) pont")
                     .foregroundColor(.gray)
               }
               Spacer()
                
                
            }
            .padding(.leading, 60.0)
             

            ScrollView(.horizontal, showsIndicators: false) {
               HStack(spacing: 30.0) {
                  ForEach(jobsUI) { job in
                     Button(action: { self.showContent.toggle() }) {
                        GeometryReader { geometry in
                            CourseView(title: job.item.propertis,
                                      image: "workerhat",
                                      color: Color("background8"),
                                      shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5))
                              .rotation3DEffect(Angle(degrees:
                                 Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
                              .sheet(isPresented: self.$showContent) { /*ContentView()*/ }
                        }
                        .frame(width: 246, height: 360)
                     }
                  }
               }
               .padding(.leading, 30)
               .padding(.top, 30)
               .padding(.bottom, 70)
               Spacer()
            }
            //CertificateRow()
         }
         .padding(.top, 78)
          
          if settings.jobDeleteSuccess
          {
              SuccessCardUIView().onAppear(perform: {
                  DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                      withAnimation()
                      {
                          print("UJRATOLTES")
                          askUserData()
                          askJobData()
                           
                      }
                  })
                  
                  
                  
                  
              }).opacity(0.9).transition(.opacity)
              
              
          }
          
          if settings.jobPutSuccess
          {
              SuccessCardUIView().onAppear(perform: {
                  DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                      withAnimation()
                      {
                          print("UJRATOLTES")
                          //askUserData()
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
                          //askUserData()
                          askJobData()
                           
                      }
                  })
                  
                  
                  
                  
              }).opacity(0.9).transition(.opacity)
          }
          
      }.onAppear()
       {
           askUserData()
           askJobData()
       }
       
       
   }
    
    func askUserData()
    {
        print("HOMELIST")
        let user = User(inData: UserData(inUser: UserSettingsWorker.shared.values["userName"] as? String ?? "", inPass: "0", inRole: "", inScore: 0))
        user.dataHandler.get(input: user) { valaszUser, valaszKesz in
            print("PROFILLEKERES KESZ? :\(valaszKesz)")
            print(valaszUser.username)
            
            if valaszKesz
            {
                self.userUI = valaszUser
                //spinner.toggle()
            }
            
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
struct HomeList_Previews: PreviewProvider {
   static var previews: some View {
      HomeList()
   }
}
#endif

struct CourseView: View {

   var title = "Build an app with SwiftUI"
   var image = "workerhat"
   var color = Color("background3")
   var shadowColor = Color("backgroundShadow3")

   var body: some View {
      return VStack(alignment: .leading) {
         Text(title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(30)
            .lineLimit(4)

         Spacer()

         Image(image)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 246, height: 150)
            .padding(.bottom, 30)
      }
      .background(color)
      .cornerRadius(30)
      .frame(width: 246, height: 360)
      .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
   }
}

struct Course: Identifiable {
   var id = UUID()
   var title: String
   var image: String
   var color: Color
   var shadowColor: Color
}

let coursesData = [
   Course(title: "Munka leírása",
          image: "car",
          color: Color("background3"),
          shadowColor: Color("backgroundShadow3")),
   Course(title: "Munka leírása",
          image: "car",
          color: Color("background4"),
          shadowColor: Color("backgroundShadow4")),
   Course(title: "Munka leírása",
          image: "car",
          color: Color("background7"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
   Course(title: "Munka leírása",
          image: "car",
          color: Color("background8"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
   Course(title: "Munka leírása",
          image: "car",
          color: Color("background9"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]


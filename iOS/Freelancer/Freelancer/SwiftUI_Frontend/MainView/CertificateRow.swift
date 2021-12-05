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

   var body: some View {
      VStack(alignment: .leading) {
         Text("Folyamatban")
            .font(.system(size: 20))
            .fontWeight(.heavy)
            .padding(.leading, 30)

         ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
               ForEach(certificates) { item in
                  CertificateView(item: item)
               }
            }
            .padding(20)
            .padding(.leading, 10)
         }
      }
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


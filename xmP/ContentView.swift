

import SwiftUI

struct City : Identifiable{      //model
    let id = UUID()
    let name: String
    let img: String
    let attraction :[String]
    let cuisine : [String]
    let traveltips :[String]
}

let cityArray = [      // sample data
 City(
 name: "Aluva", img: "Aluva", attraction: ["Eiffel Tower", "Louvre Museum", "Notre-Dame Cathedral"], cuisine: ["Croissants", "Baguette", "Crème brûlée"], traveltips: ["Buy tickets online for attractions", "Use Metro for easy travel"]),
 City(name: "Kollam", img: "Kollam", attraction: ["Eiffel Tower", "Louvre Museum", "Notre-Dame Cathedral"], cuisine: ["Croissants", "Baguette", "Crème brûlée"], traveltips: ["Buy tickets online for attractions", "Use Metro for easy travel"]
     ),
 City(
 name: "Ernakulam", img: "Ekm", attraction: ["Eiffel Tower", "Louvre Museum", "Notre-Dame Cathedral"], cuisine: ["Croissants", "Baguette", "Crème brûlée"], traveltips: ["Buy tickets online for attractions", "Use Metro for easy travel"]),
 City(name: "Palakkad", img: "Palakkad", attraction: ["Eiffel Tower", "Louvre Museum", "Notre-Dame Cathedral"], cuisine: ["Croissants", "Baguette", "Crème brûlée"], traveltips: ["Buy tickets online for attractions", "Use Metro for easy travel"]
     )
]

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(cityArray) {
                city in
                NavigationLink(destination: CityDetails(city: city)){
                    HStack{
                        Image(city.img)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                        Text(city.name).font(.title3)
                            .fontWeight(.semibold)
                                                                                
                    }.padding(.vertical,10.0)         //end of Hstack
                }
            }.navigationTitle("CITY ERPLORER")      // end of list
        }
        
    }
}
struct CityDetails : View{
    let city :City
    var body: some View{
   ScrollView{
VStack(alignment:.leading, spacing: 16){
        Image(city.img)
        .resizable()
        .scaledToFill()
        .cornerRadius(10)
        .shadow(radius: 5)
    Text(city.name)
        .font(.largeTitle)
        .bold()
        .padding(.bottom,10)
    Group{
        Text("Attractions")
            .font(.headline)
        ForEach(city.attraction, id: \.self){
            item in Text(". \(item)")
        }
    
        Text("cuisine")
            .font(.headline)
            .padding(.top,10)
        ForEach(city.cuisine, id: \.self){
            item in Text(". \(item)")
        }
        Text("travelTips")
            .font(.headline)
            .padding(.top,10)
        ForEach(city.traveltips, id: \.self){
            item in Text(". \(item)")
        }
    }
}      //nd of vstack
.padding()
   }   //scrollview
   .navigationTitle(city.name)
   .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

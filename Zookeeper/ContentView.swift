//
//  ContentView.swift
//  Zookeeper
//
//  Created by MAC on 25/08/22.
//

import SwiftUI

/*//Redefiniendo el struct para que sea dinámico
struct ContentView: View {
    var body: some View {
        
        //Para que la vista se vea en forma de línea vertical
            /*VStack {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }*/
        
        //Sin embargo hay otra estructura mas poderosa que describe lo mismo:

        //Agregando modificadores de lista
        VStack {
            /*Text("I ❤️ List").font(.headline)
            List {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
            .listStyle(InsetGroupedListStyle())
        }*/
        
        //Agregando la vista de la matriz de animales
        // identificador unico
        /*List(animals, id: \.uniqueID) { animal in
                    Text(animal.name)
                }*/
        //Debido a que estamos usando UUID por lo que eliminamos esas partes:
        List(animals) { animal in
                    Text(animal.name)
                }
    }
    }
    }
 
 Animal(name: "Cat"),
 Animal(name: "Parrot")
 */


/*Por el método tambien se cambia esta declaración de la matriz
let animals = [
    Animal(uniqueID: 0, name: "Dog"),
    Animal(uniqueID: 1, name: "Cat"),
    Animal(uniqueID: 2, name: "Parrot")
]*/

/*let animals = [
    Animal(name: "Dog"),
    Animal(name: "Cat"),
    Animal(name: "Parrot")
]*/

struct ContentView: View{
  /*@State var animals = [
    Animal(name: "Dog"),
   ]*/
       var body: some View {
               /*VStack {
                   //Con estructura forEach para añadir seccion
                   /*List(animals) { animal in
                       Text(animal.name)*/*/
                   List{
                   ForEach(animalGroups) { animalGroup in
                       Section(header: Text(animalGroup.groupName)) {           ForEach(animalGroup.animals){ animal in
                                   Text(animal.name)
                            }
                            /* Button("Add") {
                       animals.append(Animal(name: "New animal"))
                             }*/
                       }
                   }
                   }
               }
       }
    /* Se modificará para usar el protocolo identificable
    struct Animal {
        var uniqueID : Int
        var name: String
    }
     */
    

    struct Animal: Identifiable {
     var id = UUID()
     var name : String
 }

struct AnimalGroup: Identifiable {
    var id = UUID()
    var groupName : String
    var animals : [Animal]
}


let animalGroups = [
    AnimalGroup(groupName: "Pets", animals: [
        Animal(name: "Dog"),
        Animal(name: "Cat"),
        Animal(name: "Parrot"),
        Animal(name: "Mouse")
    ]),
    AnimalGroup(groupName: "Farm", animals: [
        Animal(name: "Cow"),
        Animal(name: "Horse"),
        Animal(name: "Goat"),
        Animal(name: "Sheep"),
    ]),
    AnimalGroup(groupName: "Critters", animals: [
        Animal(name: "Firefly"),
        Animal(name: "Spider"),
        Animal(name: "Ant"),
        Animal(name: "Squirrel"),
    ])
]


struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

import 'package:coffee_app/util/coffee_tile.dart';
import 'package:coffee_app/util/coffee_type.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    ['Cappucino' , true],
    ['Latte' , false],
    ['Expresso', false],
    ['Mocha', false],
    ['Americano', false]

  ];
  void coffeeTypeSelected (int index){
    setState(() {
      for (int i = 0; i < coffeeType.length; i++){
        coffeeType [i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items:  const [
        BottomNavigationBarItem(
            icon : Icon( Icons.home,),
            label: ''
        ),
        BottomNavigationBarItem(
            icon : Icon( Icons.notifications,),
            label: ''
        ),
        BottomNavigationBarItem(
            icon : Icon( Icons.favorite,),
            label: ''
        ),
]
      ),
      body: Column(
        children:  [
           const Padding (
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text('Find the best coffee for you',
            style: TextStyle(
              fontSize: 56,
              fontFamily: 'BebasNeue'
            ),),
            ),
        const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your Coffee..',
                focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600
                ),),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600)
                ),
              ),
            ),
          ),
          const SizedBox(height: 25,),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
                itemBuilder: (context , index) {
              return CoffeeType(coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap:(){
                coffeeTypeSelected(index);
                  });
            })
          ),
          Expanded(child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: 'images/latte.jpg',
                coffeeName: "Cappucino",
                coffeePrice: "4.20",
              ),
              CoffeeTile(
                coffeeImagePath: 'images/fee.jpg',
                coffeeName: "Expresso",
                coffeePrice: "5.00",
              ),
              CoffeeTile(
                coffeeImagePath: 'images/cof.jpg',
                coffeeName: "Mocha",
                coffeePrice: "4.5120",
              ),

            ],
          ),),

        ],
      ),
    );

  }
}

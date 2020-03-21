import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryListItem {
  CategoryListItem({
    @required this.categoryIcon,
    @required this.categoryName,
    @required this.availability,
    @required this.selected,
    
  });

  IconData categoryIcon;
  String categoryName;
  int availability;
  bool selected;
  
}


class ListaDeCategorias extends StatefulWidget {
  
  @override
  _ListaDeCategoriasState createState() => _ListaDeCategoriasState();
}

class _ListaDeCategoriasState extends State<ListaDeCategorias> {

  var items = [
    CategoryListItem(
      categoryIcon: Icons.fastfood,
      categoryName: "Hamburger",
      availability: 10,
      selected: true,
    ),
    CategoryListItem(
      categoryIcon: Icons.local_pizza,
      categoryName: "Pizza",
      availability: 4,
      selected: false,
    ),
    CategoryListItem(
      categoryIcon: Icons.local_dining,
      categoryName: "Jantinha",
      availability: 2,
      selected: false,
    ),
    CategoryListItem(
      categoryIcon: Icons.local_bar,
      categoryName: "Milk Shake",
      availability: 1,
      selected: false,
    ),
    CategoryListItem(
      categoryIcon: Icons.local_bar,
      categoryName: "Açai",
      availability: 6,
      selected: false,
    ),
  ];

  _changeState(item, items){
    setState(() {
      for (var i in items) {
        if (i == item){
          if (item.selected == true){
            item.selected = false;
          } else {
            item.selected = true;
          }
        } else {
          i.selected = false;
        }
      }
    });
  }

  Widget _renderItem(BuildContext context, item) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color:  item.selected ? Colors.amber : Colors.white,
        border: Border.all(
            color: item.selected ? Colors.transparent : Colors.grey[200],
            width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 15,
            offset: Offset(15, 0),
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: item.selected ? Colors.transparent : Colors.grey[200],
                    width: 1.5)),
            child: Icon(
              item.categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(height: 10),
          Text(
            item.categoryName,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            item.availability.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index){
        var item = items[index];

        return GestureDetector(
          onTap: (){
            _changeState(item, items);
          },
          child: _renderItem(context, item),
        );
      },
    );
  }


}
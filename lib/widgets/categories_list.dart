import 'package:flutter/material.dart';

class CategorisList extends StatefulWidget {
  @override
  _CategorisListState createState() => _CategorisListState();
}

class _CategorisListState extends State<CategorisList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                image: DecorationImage(
                  image: Image.asset('assets/man.png').image,
                  fit: BoxFit.cover,
                )),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  'assets/man.png',
                  fit: BoxFit.cover,
                  width: 25,
                  height: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Enter name'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:app/components/utilities/dropDownMenu.dart';
import 'package:flutter/material.dart';

class loadScreen extends StatefulWidget {
  @override
  _loadScreenState createState() => _loadScreenState();
}

class _loadScreenState extends State<loadScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dropDownMenu(),
                Icon(
                  Icons.compare_arrows_outlined,
                ),
                dropDownMenu()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextFormField(
              controller: TextEditingController()..text = "Input Text Here",
              onChanged: (text) => {},
              keyboardType: TextInputType.multiline,
              maxLines: 10,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.indigoAccent,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.translate),
                color: Colors.white,
              )),
          SizedBox(
            height: 10,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text("Output Text Here"))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class worldwidepanel extends StatelessWidget {
  final Map worldata;

  worldwidepanel({required this.worldata});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          statuspanel(
            panelcolor: Colors.red.shade100,
            textcolor: Colors.red,
            title: 'CONFIRMED',
            count: worldata['cases'].toString(),
          ),
          statuspanel(
            panelcolor: Colors.lightBlue.shade100,
            textcolor: Colors.lightBlue,
            title: 'ACTIVE',
            count: worldata['active'].toString(),
          ),
          statuspanel(
            panelcolor: Colors.green.shade100,
            textcolor: Colors.green,
            title: 'RECOVERED',
            count: worldata['recovered'].toString(),
          ),
          statuspanel(
            panelcolor: Colors.purpleAccent.shade100,
            textcolor: Colors.purple,
            title: 'DEATHS',
            count: worldata['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class statuspanel extends StatelessWidget {
  final Color panelcolor;
  final Color textcolor;
  final String title;
  final String count;
  const statuspanel(
      {required this.title,
      required this.count,
      required this.panelcolor,
      required this.textcolor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      color: panelcolor,
      height: 80,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: textcolor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            count,
            style: TextStyle(
              color: textcolor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

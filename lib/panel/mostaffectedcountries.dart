import 'package:flutter/material.dart';

class mostaffectedcountries extends StatelessWidget {
  final List countrydata;
  mostaffectedcountries({required this.countrydata});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        // physics: NeverScrollableScrollPhysics,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Image.network(
                  countrydata[index]['countryInfo']['flag'],
                  width: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(countrydata[index]['country']),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Deaths : ' + countrydata[index]['deaths'].toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}

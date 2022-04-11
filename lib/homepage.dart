import 'dart:convert';

import 'package:covid_19_tracker/constant.dart';
import 'package:covid_19_tracker/pages/countrypage.dart';
import 'package:covid_19_tracker/panel/infopanel.dart';
import 'package:covid_19_tracker/panel/mostaffectedcountries.dart';
import 'package:covid_19_tracker/panel/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Map? wordldata;
  fetchworldwidedata() async {
    var url = Uri.parse('https://corona.lmao.ninja/v2/all');
    http.Response response = await http.get(url);
    setState(() {
      print(response.statusCode);
      wordldata = jsonDecode(response.body);
      print(wordldata);
    });
  }

  List? countrydata;
  fetchcountrydata() async {
    var url =
        Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries?sort=cases');
    http.Response response = await http.get(url);
    setState(() {
      print(response.statusCode);
      countrydata = jsonDecode(response.body);
      print(countrydata);
    });
  }

  @override
  void initState() {
    fetchworldwidedata();
    fetchcountrydata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryblack,
        centerTitle: true,
        title: Text('COVID-19 TRACKER'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              color: Colors.orange[100],
              padding: EdgeInsets.all(10),
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WORLDWIDE',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => countrypage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: primaryblack,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'REGIONAL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            wordldata == null
                ? CircularProgressIndicator()
                : worldwidepanel(
                    worldata: wordldata!,
                  ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Most Affected Countries',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            countrydata == null
                ? CircularProgressIndicator()
                : mostaffectedcountries(
                    countrydata: countrydata!,
                  ),
            infopanel(),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

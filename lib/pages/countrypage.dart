import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class countrypage extends StatefulWidget {
  @override
  _countrypageState createState() => _countrypageState();
}

class _countrypageState extends State<countrypage> {
  List? countrydata;
  fetchcountrydata() async {
    var url = Uri.parse('https://corona.lmao.ninja/v2/countries');
    http.Response response = await http.get(url);
    setState(() {
      print(response.statusCode);
      countrydata = jsonDecode(response.body);
      print(countrydata);
    });
  }

  @override
  void initState() {
    fetchcountrydata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country stats'),
      ),
      body: countrydata == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    height: 130,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 200,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                countrydata![index]['country'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Image.network(
                                countrydata![index]['countryInfo']['flag'],
                                height: 50,
                                width: 60,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'CONFIRMED:' +
                                    countrydata![index]['cases'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              Text(
                                'ACTIVE:' +
                                    countrydata![index]['active'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              Text(
                                'RECOVERED:' +
                                    countrydata![index]['recovered'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Text(
                                'DEATHS:' +
                                    countrydata![index]['deaths'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.grey[100]
                                        : Colors.grey[900]),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              },
              itemCount: countrydata == null ? 0 : countrydata!.length,
            ),
    );
  }
}

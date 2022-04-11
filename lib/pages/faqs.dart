import 'package:flutter/material.dart';
import 'package:covid_19_tracker/constant.dart';

class faqpages extends StatelessWidget {
  const faqpages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(DataSource.questionAnswers[index]['question']),
              children: [
                Text(DataSource.questionAnswers[index]['answer']),
              ],
            );
          }),
    );
  }
}

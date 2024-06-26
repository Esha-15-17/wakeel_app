import 'package:flutter/material.dart';

class SupremeCourtLawScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supreme Court Laws in Pakistan'),
        backgroundColor: Color(0xFF01411C),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Role and Jurisdiction of the Supreme Court',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Supreme Court of Pakistan is the highest judicial authority in the country. It has the ultimate appellate jurisdiction over all courts in Pakistan. The Court has the power to interpret the Constitution, and it has original jurisdiction in disputes between governments and entities as well as advisory jurisdiction.',
            ),
            SizedBox(height: 20),
            Text(
              'Constitution of Pakistan, 1973',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Supreme Court\'s powers and functions are defined under the Constitution of Pakistan, 1973. Key articles include:\n'
                  '- **Article 184**: Original jurisdiction of the Supreme Court in matters of public importance.\n'
                  '- **Article 185**: Appellate jurisdiction of the Supreme Court.\n'
                  '- **Article 186**: Advisory jurisdiction of the Supreme Court, where the President may seek the opinion of the Court on any question of law.',
            ),
            SizedBox(height: 20),
            Text(
              'Supreme Court Rules, 1980',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Supreme Court operates under the Supreme Court Rules, 1980, which outline the procedures for filing cases, hearings, and the conduct of advocates and judges. These rules ensure the orderly and efficient functioning of the Court.',
            ),
            SizedBox(height: 20),
            Text(
              'Key Functions of the Supreme Court',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '1. **Constitutional Interpretation**: The Court interprets the Constitution and has the power to review laws and executive actions for constitutionality.\n'
                  '2. **Appellate Jurisdiction**: The Court hears appeals against decisions of lower courts, including High Courts.\n'
                  '3. **Advisory Jurisdiction**: The Court can provide legal opinions to the government on matters of public importance referred by the President.\n'
                  '4. **Judicial Review**: The Court has the power to review its own judgments and orders.',
            ),
            SizedBox(height: 20),
            Text(
              'Landmark Judgments',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Supreme Court has delivered several landmark judgments that have shaped the legal and constitutional landscape of Pakistan. These include decisions on the separation of powers, fundamental rights, and electoral reforms.',
            ),
            SizedBox(height: 20),
            Text(
              'Public Interest Litigation',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Supreme Court has been proactive in addressing issues of public interest through suo motu actions and public interest litigation (PIL). This has enhanced access to justice for marginalized and disadvantaged sections of society.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.gavel),
            label: 'Laws',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Query',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Lawyers',
          ),
        ],
        selectedItemColor: Color(0xFF01411C),
        onTap: (index) {
          switch (index) {
            case 0:
            // Navigate to Laws section (current screen)
              break;
            case 1:
            // Navigate to Query section
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QueryScreen()),
              );
              break;
            case 2:
            // Navigate to Lawyers section
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LawyersScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}

class QueryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Query'),
        backgroundColor: Color(0xFF01411C),
      ),
      body: Center(
        child: Text('Query screen content here'),
      ),
    );
  }
}

class LawyersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lawyers'),
        backgroundColor: Color(0xFF01411C),
      ),
      body: Center(
        child: Text('Lawyers screen content here'),
      ),
    );
  }
}

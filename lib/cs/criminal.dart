import 'package:flutter/material.dart';

class CriminalLawScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criminal Laws in Pakistan'),
        backgroundColor: Color(0xFF01411C),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pakistan Penal Code (PPC) 1860',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Pakistan Penal Code (PPC) of 1860 is the primary penal code of Pakistan, defining various offenses and their respective punishments. It includes laws related to theft, burglary, robbery, assault, battery, rape, and murder.',
            ),
            SizedBox(height: 20),
            Text(
              'Anti-Terrorism Act (ATA) 1997',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Anti-Terrorism Act (ATA) of 1997 addresses terrorism-related offenses, expanding the definition of terrorism and increasing penalties for such crimes.',
            ),
            SizedBox(height: 20),
            Text(
              'Prevention of Electronic Crimes Act (PECA) 2016',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Prevention of Electronic Crimes Act (PECA) of 2016 deals with cybercrimes such as cyberstalking, spamming, and online defamation, with penalties including imprisonment and fines.',
            ),
            SizedBox(height: 20),
            Text(
              'Laws on Honour Killings and Acid Attacks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Amendments to the PPC and CrPC in 2004 classify honour killings as murder and provide stringent punishments to combat such violence.',
            ),
            SizedBox(height: 20),
            Text(
              'Rape and Zina Laws',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The 2006 amendment to the PPC redefined rape, providing better protection to victims by removing it from the Hudood Ordinances and including it under section 375 of the PPC.',
            ),
            SizedBox(height: 20),
            Text(
              'Objectives and Components of Criminal Law',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Criminal law in Pakistan aims to ensure that the guilty are punished and the innocent are acquitted, protecting life and order in society. The criminal justice system comprises investigation, prosecution, and trial, striving for a fair application of the law.',
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








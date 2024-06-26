import 'package:flutter/material.dart';

class ImmigrationLawScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Immigration Laws in Pakistan'),
        backgroundColor: Color(0xFF01411C),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pakistan Citizenship Act, 1951',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'This act outlines the categories of citizenship, including citizenship by birth, descent, and migration. '
                  'Citizenship by birth is granted to individuals born in Pakistan, except children of foreign diplomats or enemy aliens. '
                  'Citizenship by descent is granted to children born outside Pakistan to Pakistani parents. '
                  'Citizenship by migration is granted to persons who migrated to Pakistan from territories in the Indian subcontinent before the commencement of the act.',
            ),
            SizedBox(height: 20),
            Text(
              'Naturalization Act, 1926',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'This act provides the framework for non-Pakistanis to acquire Pakistani citizenship through naturalization. '
                  'Applicants must meet certain residency and character requirements and renounce any previous citizenship.',
            ),
            SizedBox(height: 20),
            Text(
              'Emigration Ordinance, 1979',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'This ordinance regulates the emigration of Pakistani citizens for employment abroad. '
                  'It established the Bureau of Emigration and Overseas Employment, which oversees the welfare of Pakistani emigrants and ensures their rights are protected.',
            ),
            SizedBox(height: 20),
            Text(
              'Dual Nationality',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Pakistan has dual nationality arrangements with several countries, allowing citizens to hold Pakistani citizenship alongside citizenship of another country. '
                  'Countries with such arrangements include the USA, UK, Canada, and Australia among others.',
            ),
            SizedBox(height: 20),
            Text(
              'Immigration Procedures',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Directorate General of Immigration and Passports oversees the immigration policies and procedures. '
                  'Foreign nationals can apply for different types of visas including work, study, and investment visas. '
                  'Special provisions exist for Commonwealth citizens and those investing significant amounts in Pakistan\'s economy.',
            ),
            SizedBox(height: 20),
            Text(
              'Refugees and Asylum Seekers',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Pakistan hosts a significant number of refugees, primarily from Afghanistan. '
                  'The legal framework for refugees is guided by international conventions and national policies aimed at ensuring their protection and welfare.',
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

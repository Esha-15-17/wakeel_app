import 'package:flutter/material.dart';
import 'package:wakeel_app/SpecializationLawyers.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';

class ChildCustodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: WakeelAppBar(back: true),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Guardians and Wards Act, 1890',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Guardians and Wards Act, 1890 governs the appointment of guardians and custody of children in Pakistan. It applies to all communities and provides the legal framework for custody decisions, prioritizing the welfare of the child.',
            ),
            SizedBox(height: 20),
            Text(
              'Custody of Children Act, 1959',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Custody of Children Act, 1959 allows the court to appoint a guardian in cases where a child is unable to care for themselves or their property. It emphasizes the best interests of the child in all decisions.',
            ),
            SizedBox(height: 20),
            Text(
              'Islamic Law',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Under Islamic law, mothers generally have custody of young children. For Sunni Muslims, this lasts until the boy is seven years old and until the girl reaches puberty. For Shia Muslims, the mother retains custody of a son until he is two years old and a daughter until she is seven.',
            ),
            SizedBox(height: 20),
            Text(
              'Civil Law for Non-Muslims',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Non-Muslims are subject to the Guardians and Wards Act, 1890, which also prioritizes the welfare of the child in custody decisions.',
            ),
            SizedBox(height: 20),
            Text(
              'Factors Considered in Custody Decisions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '1. Age and gender of the child\n2. Child’s preference\n3. Financial stability of each parent\n4. Moral and social standing of each parent\n5. Parental conduct\n6. Availability of supportive family members',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
                MaterialPageRoute(builder: (context) => SpecializationLawyers(specialization : "Child Custody")),
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


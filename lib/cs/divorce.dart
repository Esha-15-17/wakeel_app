import 'package:flutter/material.dart';
import 'package:wakeel_app/SpecializationLawyers.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';

class DivorceLawScreen extends StatelessWidget {
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
              'Muslim Family Laws Ordinance, 1961',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'This ordinance details the procedures for divorce among Muslims. Key points include:\n'
                  '- **Talaq (Divorce by Husband)**: The husband can pronounce talaq orally or in writing. This must be registered with the Union Council within seven days, which will then notify the wife and attempt reconciliation. If reconciliation fails, a divorce certificate is issued after 90 days.\n'
                  '- **Khula (Divorce by Wife)**: The wife can seek divorce through khula, which requires returning the mehr (dowry). The process involves filing a suit in the family court, which will issue a decree if reconciliation is not possible.',
            ),
            SizedBox(height: 20),
            Text(
              'Dissolution of Muslim Marriages Act, 1939',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'This act provides grounds on which a woman can seek a judicial divorce, such as:\n'
                  '- Absence of the husband for four years\n'
                  '- Failure to provide maintenance for two years\n'
                  '- Husband\'s imprisonment for seven years\n'
                  '- Impotence, mental illness, or cruelty.',
            ),
            SizedBox(height: 20),
            Text(
              'Family Courts Act, 1964',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Family courts in Pakistan handle divorce cases, ensuring the legal requirements are met and addressing issues like child custody, alimony, and division of assets. The court attempts reconciliation through mediation. If unsuccessful, the court proceeds with the divorce.',
            ),
            SizedBox(height: 20),
            Text(
              'Talaq Types and Procedures',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'There are different forms of talaq recognized in Pakistan:\n'
                  '- **Talaq-e-Ahsan**: A single pronouncement followed by a waiting period (iddat) of three months.\n'
                  '- **Talaq-e-Hasan**: Three pronouncements made during successive menstrual cycles.\n'
                  '- **Talaq-e-Biddat (Triple Talaq)**: Three pronouncements made at once. This form is controversial and less favored but still recognized by some Sunni schools of thought.',
            ),
            SizedBox(height: 20),
            Text(
              'Divorce for Non-Muslims',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Non-Muslim divorces are governed by the Family Laws Ordinance, 1961, where either spouse can file a divorce petition in the family court, and the process involves court hearings to attempt reconciliation and resolve related matters like child custody and asset division.',
            ),
            SizedBox(height: 20),
            Text(
              'Key Terminologies in Divorce Law',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Iddat: A waiting period after pronouncing divorce.\n'
                  'Mehr: Dowry given by the husband to the wife.\n'
                  'Arbitration Council: A body formed by the Union Council to attempt reconciliation between divorcing parties.',
            ),
            SizedBox(height: 20),
            Text(
              'Challenges and Legal Assistance',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Divorce can be a complex and emotionally taxing process, often involving lengthy court proceedings, especially when child custody, alimony, and asset division are contested. Legal assistance is crucial to navigate these complexities effectively.',
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
                MaterialPageRoute(builder: (context) => SpecializationLawyers(specialization : "Divorce Court")),
                // MaterialPageRoute(builder: (context) => SpecializationLawyers(specialization : "Divorce")),
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

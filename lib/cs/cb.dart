import 'package:flutter/material.dart';

class ChequeBounceLawScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cheque Bounce Laws in Pakistan'),
        backgroundColor: Color(0xFF01411C),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Negotiable Instruments Act, 1881',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The act outlines the legal framework for negotiable instruments like cheques, promissory notes, and bills of exchange. Key sections include:\n'
                  '- **Section 138**: Deals with the dishonor of cheques due to insufficient funds or if it exceeds the amount arranged to be paid from that account.\n'
                  '- **Section 139**: Presumes that the cheque was issued for the discharge of a debt or liability.\n'
                  '- **Section 140**: Details the defenses available to the drawer of the cheque.\n'
                  '- **Section 141**: Explains the liability of the company and its officers when a cheque issued by a company is dishonored.',
            ),
            SizedBox(height: 20),
            Text(
              'Procedure for Filing a Complaint',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'To file a complaint for a cheque bounce:\n'
                  '- **Demand Notice**: The payee must send a written demand notice to the drawer within 30 days of receiving the bounced cheque, demanding the payment.\n'
                  '- **Waiting Period**: The drawer has 15 days to settle the payment after receiving the notice.\n'
                  '- **Filing a Complaint**: If the drawer fails to make the payment within this period, the payee can file a complaint in the court of the relevant jurisdiction within one month.',
            ),
            SizedBox(height: 20),
            Text(
              'Penalties for Cheque Bounce',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The penalties for cheque bounce under the Negotiable Instruments Act can include:\n'
                  '- **Imprisonment**: Up to one year.\n'
                  '- **Fine**: Up to twice the amount of the cheque.\n'
                  '- **Both**: In some cases, both imprisonment and fine.',
            ),
            SizedBox(height: 20),
            Text(
              'Civil and Criminal Liabilities',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Criminal Liability: Handled under Section 138 of the Negotiable Instruments Act.\n'
                  'Civil Liability: The payee can also file a civil suit for recovery of the cheque amount, along with interest and damages.',
            ),
            SizedBox(height: 20),
            Text(
              'Case Law and Precedents',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Courts in Pakistan have consistently held that issuing a cheque with insufficient funds is a serious offense, emphasizing timely payment and strict adherence to the legal process to deter such practices.',
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

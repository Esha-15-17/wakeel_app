import 'package:flutter/material.dart';

class CybercrimeLawScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cybercrime Laws in Pakistan'),
        backgroundColor: Color(0xFF01411C),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prevention of Electronic Crimes Act (PECA), 2016',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Prevention of Electronic Crimes Act (PECA) of 2016 addresses cybercrimes such as cyberstalking, spamming, and online defamation. It includes provisions for data protection, electronic fraud, unauthorized access to information systems, and cyberterrorism.',
            ),
            SizedBox(height: 20),
            Text(
              'Key Offenses under PECA',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '1. **Unauthorized Access**: Gaining access to any information system or data without permission.\n'
                  '2. **Cyberstalking**: Using electronic means to harass, intimidate, or threaten individuals.\n'
                  '3. **Cyberterrorism**: Using cyberspace to promote terrorism or engage in activities threatening national security.\n'
                  '4. **Electronic Fraud**: Using electronic means to commit fraud or deceive individuals.\n'
                  '5. **Data Damage**: Intentionally damaging or altering data without authorization.\n'
                  '6. **Hate Speech**: Using electronic means to spread hate speech or incite violence against individuals or groups.',
            ),
            SizedBox(height: 20),
            Text(
              'Penalties and Punishments',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The penalties for cybercrimes under PECA include fines, imprisonment, and confiscation of equipment used in committing the crimes. The severity of the punishment depends on the nature and impact of the offense.',
            ),
            SizedBox(height: 20),
            Text(
              'Reporting and Enforcement',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Cybercrime complaints can be reported to the Federal Investigation Agency (FIA) in Pakistan. The FIA has a dedicated Cybercrime Wing responsible for investigating and prosecuting cybercrimes under PECA.',
            ),
            SizedBox(height: 20),
            Text(
              'Preventive Measures and Best Practices',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '1. **Use Strong Passwords**: Ensure passwords are complex and changed regularly.\n'
                  '2. **Update Software**: Keep all software, including antivirus programs, up to date.\n'
                  '3. **Secure Networks**: Use encryption and secure Wi-Fi connections.\n'
                  '4. **Be Wary of Phishing**: Avoid clicking on suspicious links or providing personal information to unverified sources.\n'
                  '5. **Educate Yourself**: Stay informed about the latest cyber threats and best practices for cybersecurity.',
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

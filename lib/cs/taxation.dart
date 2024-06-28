import 'package:flutter/material.dart';
import 'package:wakeel_app/SpecializationLawyers.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';

class TaxationLawScreen extends StatelessWidget {
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
              'Income Tax Ordinance, 2001',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Income Tax Ordinance, 2001 governs the income tax regime in Pakistan. It outlines the tax structure, filing requirements, tax rates, exemptions, and penalties for non-compliance.',
            ),
            SizedBox(height: 20),
            Text(
              'Sales Tax Act, 1990',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Sales Tax Act, 1990 regulates the levy, collection, and administration of sales tax on goods and services in Pakistan. It includes provisions for registration, filing returns, and audit procedures.',
            ),
            SizedBox(height: 20),
            Text(
              'Federal Excise Act, 2005',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'This act deals with the imposition of excise duties on the manufacture, production, and importation of goods, as well as certain services. It provides the legal framework for the administration and collection of excise duties.',
            ),
            SizedBox(height: 20),
            Text(
              'Customs Act, 1969',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Customs Act, 1969 governs the import and export of goods in Pakistan. It outlines the procedures for customs declarations, assessments, duties, and penalties for violations.',
            ),
            SizedBox(height: 20),
            Text(
              'Key Concepts in Taxation',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '1. **Tax Year**: The period for which tax returns are filed, typically from July 1 to June 30.\n'
                  '2. **Taxable Income**: The portion of income subject to tax after deductions and exemptions.\n'
                  '3. **Withholding Tax**: Tax deducted at source on certain types of payments, such as salaries and dividends.\n'
                  '4. **Tax Return**: The document filed with the tax authorities declaring income, deductions, and tax payable.\n'
                  '5. **Audit**: The examination of tax returns and records by the tax authorities to ensure compliance.',
            ),
            SizedBox(height: 20),
            Text(
              'Tax Incentives and Exemptions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The government offers various tax incentives and exemptions to encourage investment and economic growth. These may include tax holidays, reduced tax rates for certain industries, and exemptions for specific types of income.',
            ),
            SizedBox(height: 20),
            Text(
              'Penalties and Compliance',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Failure to comply with tax laws can result in penalties, fines, and legal action. Common non-compliance issues include failure to file returns, underreporting of income, and evasion of taxes.',
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
                MaterialPageRoute(builder: (context) => SpecializationLawyers(specialization : "Taxation")),
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

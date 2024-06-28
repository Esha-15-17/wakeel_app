import 'package:flutter/material.dart';
import 'package:wakeel_app/SpecializationLawyers.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';

class PropertyLawScreen extends StatelessWidget {
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
              'Transfer of Property Act, 1882',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'This act governs the transfer of property in Pakistan. It details the processes and legalities involved in transferring property ownership through sale, mortgage, lease, gift, and inheritance. It ensures that property transactions are conducted lawfully.',
            ),
            SizedBox(height: 20),
            Text(
              'Registration Act, 1908',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'This act requires that certain documents, such as sale deeds and lease agreements, must be registered with the relevant authorities to ensure legality and authenticity. Registration provides public notice of the transaction and helps prevent fraud.',
            ),
            SizedBox(height: 20),
            Text(
              'Stamp Act, 1899',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'This act mandates the payment of stamp duty on certain documents, which is a tax paid to the government. The stamp duty varies depending on the value and location of the property.',
            ),
            SizedBox(height: 20),
            Text(
              'Land Revenue Act, 1967',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'This act outlines the collection and administration of land revenue. It includes provisions for land assessment, revenue collection, and maintenance of land records. The act ensures that landowners pay a portion of their land\'s produce to the government as revenue.',
            ),
            SizedBox(height: 20),
            Text(
              'Tenancy Laws',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'These laws govern the relationship between landlords and tenants, ensuring fair rental practices and protecting the rights of both parties. They cover issues such as rent agreements, eviction processes, and tenants\' rights.',
            ),
            SizedBox(height: 20),
            Text(
              'Inheritance and Succession Laws',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'These laws dictate how property is distributed after the death of the owner. They include Islamic inheritance laws (Sharia rules) and specific acts like the Succession Act of 1925, which apply to non-Muslims.',
            ),
            SizedBox(height: 20),
            Text(
              'Environmental Laws',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'The Pakistan Environmental Protection Act, 1997, and other regulations ensure that property development and use comply with environmental standards to protect public health and the environment.',
            ),
            SizedBox(height: 20),
            Text(
              'Key Terminologies in Property Law',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Title Deed: A legal document proving property ownership.\n'
                  'Mutation: The process of transferring property ownership in official records.\n'
                  'Power of Attorney: A legal document allowing one person to act on behalf of another in property matters.\n'
                  'Lease: A contract outlining the terms under which one party agrees to rent property from another.\n'
                  'Mortgage: A loan secured by the property being purchased.',
            ),
            SizedBox(height: 20),
            Text(
              'Legal Requirements for Property Ownership',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'To own property in Pakistan, one must ensure that the property is free of legal disputes, properly registered, and complies with local zoning regulations. Foreign nationals can also invest in Pakistani real estate under certain conditions, often requiring partnership with local entities.',
            ),
            SizedBox(height: 20),
            Text(
              'Dispute Resolution',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Property disputes in Pakistan can be resolved through the civil courts or alternative dispute resolution methods. The legal system offers mechanisms to handle conflicts related to property boundaries, titles, ownership, and tenancy issues.',
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
                MaterialPageRoute(builder: (context) => SpecializationLawyers(specialization : "Property")),
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


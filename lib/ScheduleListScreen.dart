import 'package:flutter/material.dart';

class ScheduleListScreen extends StatelessWidget {
  final int type;

  // Constructor with parameters to initialize the data
  ScheduleListScreen({required this.type});

  final List<Map<String, String>> list = [
    {'data': 'data', 'status': 'Completed'},
    {'data': 'data', 'status': 'Ongoing'},
    {'data': 'data', 'status': 'Ongoing'},
    {'data': 'data', 'status': 'Canceled'},
    {'data': 'data', 'status': 'Canceled'},
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String desiredStatus = ((type == 1)
        ? "Ongoing"
        : type == 2
            ? "Completed"
            : "Canceled");
    var color = ((type == 1)
        ? 0xFF01411C
        : type == 2
            ? 0xFFCA9D3E
            : 0xFF3D3D3D);
    int textColor = type == 1
        ? 0xFFFFFFFF
        : type == 2
            ? 0xFFFFFFFF
            : 0xFF3D3D3D;
    List<Map<String, String>> filteredList =
        list.where((item) => item['status'] == desiredStatus).toList();

    return SafeArea(
        child: Scaffold(
      body: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final item = filteredList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0XFF888888),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(color),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          item['status'] ?? "",
                          style: const TextStyle(
                            color: Color(0XFFFFFFFF),
                            // Set the text color to #3D3D3D
                            fontSize: 16, // Set the font size
                          ),
                        )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(child: Text('write review')),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xff01411C),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                            child: Text(
                          'win case',
                          style: TextStyle(color: Color(0xFFFFFFFF)),
                        )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cheque Bounce',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Rs-/3000',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Servied By \n Avd Bashir'),
                        Text(
                          '|',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text('Vehicle \n Kia SLots'),
                        Text(
                          '|',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text('25-02-2024 \n Friday')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'bus_ticket_screen.dart'; // Import the BusTicketScreen

class SelectStopScreen extends StatefulWidget {
  const SelectStopScreen({Key? key}) : super(key: key);

  @override
  _SelectStopScreenState createState() => _SelectStopScreenState();
}

class _SelectStopScreenState extends State<SelectStopScreen> {
  List<String> stops = [
    'BANCASI-DUMALAGAN KM 0',
    'CEMETERY KM 1',
    'BANCASI ROTUNDA KM 2',
    'IDEMI - TOYOTA KM 3',
    'LIBERTAD SPORTS COMPLEX KM 4',
    'FERNANDEZ - SALAS KM 5',
    'BUTUAN DOCTORS - DOTTIES KM 6',
    'CAILANO - DBP KM 7',
    'OCHOA KM 8',
    'ALBA - ZCC KM 9',
    'PALAWAN - J MARKETING KM 10',
    'BAAN VIADUCT - Flying V KM 11',
    'Filinvest KM 12',
    'Eastwood - Wilton KM 13',
    'Tiniwisan Crossing KM 14',
    'PHISCI - Vista Man KM 15',
    'Ampayon Rotunda KM 16',
  ];

  String? selectedStop;
  bool reverseOrder = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Starting Stop'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: const Text('Select Starting Stop'),
              value: selectedStop,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.orange,
              ),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedStop = newValue;
                    reverseOrder = newValue == 'Ampayon Rotunda KM 16';
                  });
                }
              },
              items: stops.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedStop != null
                  ? () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusTicketScreen(
                      startingStop: selectedStop!,
                      reverseOrder: reverseOrder,
                    ),
                  ),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Text('CONTINUE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

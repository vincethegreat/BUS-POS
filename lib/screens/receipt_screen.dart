import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  final String startingStop;
  final String destinationStop;
  final double fare;
  final bool isDiscounted;

  const ReceiptScreen({
    Key? key,
    required this.startingStop,
    required this.destinationStop,
    required this.fare,
    this.isDiscounted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Starting Stop: $startingStop',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Destination Stop: $destinationStop',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Fare Type: ${isDiscounted ? 'Discounted' : 'Regular'}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Fare: ₱${fare.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the receipt screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text('Close'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Simulate a print action by briefly navigating to a blank screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => _PrintScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text('Print'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PrintScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate the black screen effect
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context); // Return to previous screen after delay
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
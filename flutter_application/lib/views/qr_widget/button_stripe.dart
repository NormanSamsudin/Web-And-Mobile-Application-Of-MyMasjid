import 'package:flutter/material.dart';
import 'package:flutter_application/services/stripe_service.dart';

class PaymentStripeButton extends StatelessWidget {
  const PaymentStripeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
      child: Container(
        width: double.infinity, // Makes the button take up full width
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Background color
            foregroundColor: Colors.white, // Text color
            padding: const EdgeInsets.symmetric(vertical: 16), // Button padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
          ),
          onPressed: () {
            // Implement logic for handling payment using Stripe API
             StripeService.instance.makePayment();
          },
          child: const Text('Online Transfer'),
        ),
      ),
    );
  }
}

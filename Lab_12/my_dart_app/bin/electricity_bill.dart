import 'dart:io';

// Function to calculate electricity bill based on tiered rates
double calculateElectricityBill(double kwh) {
  double bill = 0.0;
  double rate;

  if (kwh <= 100) {
    rate = 150;
    bill = kwh * rate;
  } else if (kwh <= 200) {
    rate = 210;
    bill = kwh * rate;
  } else if (kwh <= 300) {
    rate = 300;
    bill = kwh * rate;
  } else if (kwh <= 400) {
    rate = 420;
    bill = kwh * rate;
  } else if (kwh <= 500) {
    rate = 520;
    bill = kwh * rate;
  } else { // Above 500 kWh
    rate = 670;
    bill = kwh * rate;
  }
  return bill;
}

void main(List<String> arguments) {
  print('--- Electricity Bill Calculator ---');

  double kwh;

  if (arguments.isNotEmpty) {
    // Use command-line argument if provided
    try {
      kwh = double.parse(arguments[0]);
      if (kwh < 0) {
        print('Usage cannot be negative.');
        return; // Exit if input is invalid
      }
    } catch (e) {
      print('Invalid input for kWh. Please provide a valid number.');
      return; // Exit if input is invalid
    }
  } else {
    // Fallback to interactive input if no argument is provided
    print('Enter your monthly electricity usage in kWh:');
    String? input = stdin.readLineSync();

    if (input == null) {
      print('No input received.');
      return; // Exit if no input
    }

    try {
      kwh = double.parse(input);
      if (kwh < 0) {
        print('Usage cannot be negative.');
        return; // Exit if input is invalid
      }
    } catch (e) {
      print('Invalid input. Please enter a valid number for kWh.');
      return; // Exit if input is invalid
    }
  }

  // Calculate and print the bill
  double totalBill = calculateElectricityBill(kwh);
  print('Your estimated electricity bill is: ${totalBill.toStringAsFixed(2)} KHR');
}

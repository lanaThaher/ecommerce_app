import 'package:flutter/material.dart';

class OrderStepper extends StatelessWidget {
  final int currentStep;
  final List<String> steps;

  const OrderStepper({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isEven) {
          // Circle step
          int stepIndex = index ~/ 2;
          bool isActive = stepIndex <= currentStep;
          return Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: isActive
                      ? const Icon(Icons.check, size: 16, color: Colors.white)
                      : Text(
                          '${stepIndex + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                steps[stepIndex],
                style: TextStyle(
                  color: isActive ? Colors.black : Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          );
        } else {
          int lineIndex = (index - 1) ~/ 2;
          bool isActive = lineIndex < currentStep;
          return Expanded(
            child: Container(
              height: 4,
              color: isActive ? Colors.green : Colors.grey[300],
            ),
          );
        }
      }),
    );
  }
}

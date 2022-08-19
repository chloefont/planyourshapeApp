import 'package:flutter/material.dart';
import 'package:planyourshape/widgets/cards/main-card.dart';

class TrainingCard extends StatelessWidget {
  final double height;
  final double width;
  final String trainingName;
  final String trainingDate;

  const TrainingCard({
    required this.height,
    required this.width,
    required this.trainingName,
    required this.trainingDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustCard(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trainingName,
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: 10),
          Text(
            trainingDate,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}

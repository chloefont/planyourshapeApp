import 'dart:ffi';
import 'package:flutter/gestures.dart';
import 'package:planyourshape/widgets/cards/training_card.dart';

import '../widgets/forms/login_form.dart';
import '../widgets/cards/main-card.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan your shape'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Trainings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_sharp),
            label: 'New training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Profile',
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 15),
          padding: const EdgeInsets.all(25),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return const TrainingCard(
              height: 300,
              width: 350,
              trainingName: "Pecs biceps",
              trainingDate: "19.08.2022",
            );
          },
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
        ),
      ),
    );
  }
}

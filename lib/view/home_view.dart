import 'package:covid_tracker/models/home_model.dart';
import 'package:covid_tracker/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid 19 Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<HomeModel>(
              future: homeViewModel.fetchWorldStates(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return Card(
                    child: Column(
                      children: [
                        ReusableComponent(
                          title: 'Cases',
                          value: snapshot.data!.cases.toString(),
                        ),
                        ReusableComponent(
                          title: 'Today Cases',
                          value: snapshot.data!.todayCases.toString(),
                        ),
                        ReusableComponent(
                          title: 'Deaths',
                          value: snapshot.data!.deaths.toString(),
                        ),
                        ReusableComponent(
                          title: 'Today Deaths',
                          value: snapshot.data!.todayDeaths.toString(),
                        ),
                        ReusableComponent(
                          title: 'Recovered',
                          value: snapshot.data!.recovered.toString(),
                        ),
                        ReusableComponent(
                          title: 'Today Recovered',
                          value: snapshot.data!.todayRecovered.toString(),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableComponent extends StatelessWidget {
  final String title, value;
  const ReusableComponent(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Divider(),
      ],
    );
  }
}

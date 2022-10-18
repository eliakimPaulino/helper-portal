import 'package:flutter/material.dart';
import 'package:helper/page/widgets/cards/project_card.dart';

import '../../model/list.dart';
import '../../responsive.dart';
import 'header/header.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(),
                const SizedBox(
                  height: 15,
                ),
                const Text('Disponíveis:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Responsive(
                  mobile: mobileTabletBuilder(350),
                  tablet: mobileTabletBuilder(450),
                  desktop: desktopBuilder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget mobileTabletBuilder(double height) {
  return SizedBox(
    height: height,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      },
    ),
  );
}

Widget desktopBuilder() {
  return GridView.builder(
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
    ),
    itemCount: projects.length,
    itemBuilder: (context, index) {
      return ProjectCard(project: projects[index]);
    },
  );
}



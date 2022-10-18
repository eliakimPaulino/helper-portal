import 'package:flutter/material.dart';
import 'package:helper/page/widgets/pages/project_calc.dart';
import '../../../model/projects.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ProjectCalc())),
      child: Container(
        height: 300,
        margin: const EdgeInsets.only(top: 15.0, right: 25.0, bottom: 25.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 15),
              color: Colors.orange.withOpacity(.1),
              blurRadius: 15,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  project.name,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15.0)),
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    project.year.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  project.imageUrl,
                  fit: BoxFit
                      .cover, // fit to cover the entire Area maintain aspect ratio
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(project.description,
                maxLines: 3,
                style: const TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}

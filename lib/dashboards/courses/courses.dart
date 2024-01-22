import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/models/courses.dart';

class CoursesList extends StatefulWidget {
  final List<Course> courses;
  const CoursesList({super.key, required this.courses});

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.courses.length,
      itemBuilder: (context, index) {
        // final userDoc = usersDocs[index];
        // return Placeholder();
        return CourseListCard(course: widget.courses[index]);
      },
    );
  }
}

class CourseListCard extends StatelessWidget {
  final Course course;
  const CourseListCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    // return Text(course.fullName);
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text('Course: ${course.code != null ? course.code : ''} - ${course.fullName != null ? course.fullName : ''}'),
        subtitle: Text('Dr. ${() {
          final Faker faker = Faker();
          return faker.person.name();
        }()}'),
        leading: SizedBox(
          width: 80.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image(
              image: NetworkImage(() {
                final Faker faker = Faker();
                return faker.image.image(keywords: ['computer science', 'college', 'course'], random: true);
              }()),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            // setState(() {
            //   _editState = true;
            // });

            globals.reduxStore.dispatch(SetNavigationPayloadAction(course));
            globals.reduxStore.dispatch(NavigateToUrlAction('/course'));
          },
          icon: const Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}

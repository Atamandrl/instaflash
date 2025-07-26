import 'Categories.dart';
import 'SubHeading.dart';

class CourseDetail {
  final int course_id;
  final String coursename;
  final int course_level;
  final String deger_img;
  final Categories category;
  final SubHeading heading;

  const CourseDetail(
      this.course_id,
      this.coursename,
      this.course_level,
      this.deger_img,
      this.category,
      this.heading,
      );
}

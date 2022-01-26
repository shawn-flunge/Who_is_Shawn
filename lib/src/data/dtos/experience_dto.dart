
enum ExperienceType{
  personal,
  work
}
class ExperienceDto{

  final String project;
  final String title;
  final String period;
  final String content;
  final ExperienceType type;

  ExperienceDto({
    required this.project,
    required this.title,
    required this.period,
    required this.content,
    required this.type
  });

}
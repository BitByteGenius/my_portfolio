class ExprienceUtils {
  final String logo;
  final String role;
  final String title;
  final String subtitle;
  final String? checkletter;
  

  ExprienceUtils({
    required this.logo,
    required this.role,
    required this.title,
    required this.subtitle,
    this.checkletter,
  });
}

//############ Exprience Section ##############
List<ExprienceUtils> ExprienceSectionUtils = [
  ExprienceUtils(
    logo: 'assets/exprience/veecap.png',
    title: 'Veecap Eduventures Pvt. Ltd.',
    role: 'Developer Intern • IIT Guwahati',
    subtitle:
        'Worked in a research-driven environment with structured workflows.\nStrong communication & teamwork skills.\nTrained 800+ students under IIT Bombay initiatives.',
    checkletter: '',
  ),
  ExprienceUtils(
    logo: 'assets/projects/01.png',
    title: 'College Management App',
    role: 'Flutter Developer',
    subtitle:
        'Role-based app for Admin, Teacher & Students with full academic workflow management.',
    checkletter: '',
  ),
];
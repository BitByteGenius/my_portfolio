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
    title: 'Veecap Eduventures Pvt. Ltd.- Mar 2025- Mar 2026',
    role: 'Computer Research • IIT Guwahati',
    subtitle:
        'Gained hands-on experience with software tools and digital platforms.\nWorked in a research-driven environment at IIT Guwahati.\nImproved communication, teamwork, and reporting skills.\nTrained 800+ students under IIT Bombay initiatives.',
    checkletter: '',
  ),
  ExprienceUtils(
    logo: 'assets/exprience/greynext_logo.png',
    title: 'GreyNext Technologies Private Limited. - March 2026- May 2026',
    role: 'Software Developer Intern',
    subtitle:'Developed and maintained enterprise-grade applications, implemented responsive UI, integrated RESTful APIs, optimized performance, fixed production issues, and collaborated with cross-functional teams using Git.',
    checkletter: '',
  ),
  ExprienceUtils(
    logo: 'assets/exprience/trip8.png',
    title: 'Trip8 - March 2026- May 2026',
    role: 'Full Stack Developer',
    subtitle:'',
    checkletter: '',
  ),
];
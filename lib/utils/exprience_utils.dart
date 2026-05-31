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
    role: 'Developer Intern • IIT Guwahati',
    subtitle:
        'Worked in a research-driven environment with structured workflows.\nStrong communication & teamwork skills.\nTrained 800+ students under IIT Bombay initiatives.',
    checkletter: '',
  ),
  ExprienceUtils(
    logo: 'assets/exprience/greynext_logo.png',
    title: 'GreyNext Technologies Private Limited. - May 2026- Present',
    role: 'Software Developer Intern',
    subtitle:'',
    checkletter: '',
  ),
];
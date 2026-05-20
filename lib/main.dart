import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sabarinath Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF070707),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            SizedBox(height: 90),
            SkillsSection(),
            SizedBox(height: 90),
            ProjectsSection(),
            SizedBox(height: 90),
            ContactSection(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> launchPortfolio() async {
    final Uri url = Uri.parse(
      "https://github.com/YOUR_USERNAME",
    );

    if (!await launchUrl(url)) {
      throw Exception("Could not launch");
    }
  }

Future<void> openLink(String link) async {
  final Uri url = Uri.parse(link);

  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    debugPrint("Could not launch $link");
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF050505),
            Color(0xFF10131A),
            Color(0xFF050505),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.08),
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: -120,
            child: Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.withOpacity(0.08),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 50,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "SABARINATH",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    navButton("Home"),
                    navButton("Projects"),
                    navButton("Skills"),
                    navButton("Contact"),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors.white24,
                              ),
                            ),
                            child: const Text(
                              "Mechanical Engineer • CFD • Flutter Developer",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          const Text(
                            "Engineering\nThe Future",
                            style: TextStyle(
                              fontSize: 78,
                              height: 1,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 28),
                          SizedBox(
                            width: 650,
                            child: Text(
                              "Mechanical Engineering student specializing "
                              "in CAD, CAE, EV thermal systems, CFD, "
                              "and cross-platform software development.",
                              style: TextStyle(
                                fontSize: 20,
                                height: 1.8,
                                color: Colors.white.withOpacity(0.78),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              InkWell(
                                onTap: launchPortfolio,
                                child: buildButton(
                                  text: "View Portfolio",
                                  filled: true,
                                ),
                              ),
                              const SizedBox(width: 18),

                              InkWell(
                                onTap:() async{
                                  openLink("https://drive.google.com/file/d/15FRp2AY3nEaGa6Zg2wV7O3-g09BWNJLX/preview");
                                 

                                },
                                child: buildButton(
                                  text: "View Resume",
                                  filled: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Container(
                          height: 450,
                          width: 450,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.white12,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.withOpacity(0.2),
                                Colors.purple.withOpacity(0.2),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 60,
                                color: Colors.blue.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.precision_manufacturing_rounded,
                              color: Colors.white30,
                              size: 180,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget navButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildButton({
    required String text,
    required bool filled,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: filled ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: filled ? Colors.black : Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      "SolidWorks",
      "ANSYS Fluent",
      "CFD",
      "Thermal Analysis",
      "Flutter",
      "Python",
      "Fusion 360",
      "Firebase",
      "Supabase",
      "Structural FEA",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: "SKILLS",
            subtitle: "Technical Expertise",
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.white10,
                  ),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: "PROJECTS",
            subtitle: "Featured Engineering Work",
          ),
          const SizedBox(height: 40),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.35,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
      children: [
  ProjectCard(
    title: "EV Thermal Management",
    description:
        "CFD simulation of lithium-ion battery cooling "
        "using ANSYS Fluent and liquid cooling systems.",
    pdfLink:
        "https://drive.google.com/file/d/1hNX4EvL5N_w-AT3N2BfOOv8ToTmUQARU/preview",
  ),

  ProjectCard(
    title: "AXON Emergency Network",
    description:
        "Flutter-based emergency response platform "
        "with real-time routing and authority alerts.",
    pdfLink:
        "https://drive.google.com/file/d/14KgBUzI0OTMVGL1nUTaipbLz3p5OB4pe/preview",
  ),

  ProjectCard(
    title: "Suspension System Analysis",
    description:
        "Structural analysis of mono-shock and "
        "twin-shock systems using FEA.",
    pdfLink:
        "https://drive.google.com/file/d/1aBVX1NkpjjdjhpcQ09JEUmmsLb8Ufd6F/preview",
  ),

  ProjectCard(
    title: "Wear Analysis Project",
    description:
        "Microstructural and wear analysis of "
        "D2 Tool Steel and Aluminium.",
    pdfLink:
        "https://drive.google.com/file/d/1QM5eUeE0Af-FtLSfNEBNr05TrKomfkQh/preview",
  ),
],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String pdfLink;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.pdfLink,
  });

  Future<void> openLink(String link) async {
  final Uri url = Uri.parse(link);

  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    debugPrint("Could not launch $link");
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.25),
                  Colors.purple.withOpacity(0.25),
                ],
              ),
            ),
            child: const Icon(
              Icons.memory_rounded,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.72),
              height: 1.7,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 28),
          InkWell(
            onTap:() async{ openLink(pdfLink);},
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "View Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.open_in_new_rounded,
                    color: Colors.black,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: const Color(0xFF101010),
          borderRadius: BorderRadius.circular(35),
          border: Border.all(
            color: Colors.white10,
          ),
        ),
        child: Column(
          children: [
            const Text(
              "LET'S CONNECT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Engineering • Simulation • Software",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 18,
              runSpacing: 18,
              alignment: WrapAlignment.center,
              children: [
                contactButton("GitHub"),
                contactButton("LinkedIn"),
                contactButton("Email"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget contactButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF181818),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.blue.shade300,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import '../widgets/bottom_design.dart';
import '../widgets/top_design.dart';
import '../widgets/sidebar.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Sidebar(), // This will make the drawer appear from the right
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopDesign(),
              SizedBox(height: 20),
              // Logo and Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/unc_logo.png',
                      height: 50,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UNIVERSITY OF NUEVA CACERES',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Property Management Office',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Property Office Header
              Container(
                color: Colors.grey[300],
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PROPERTY OFFICE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Builder(
                      builder: (context) => IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer(); // This opens the drawer from the right
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Mission Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'UNIVERSITY OF NUEVA CACERES',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'PROPERTY MANAGEMENT SYSTEM',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'MISSION',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'The University of Nueva Caceres shall be a leading exponent of academic excellence, research, extension and innovative technology for sustainable development. It creates a nurturing academic environment and provides equal opportunities in the formation of individuals into empowered leaders, competent professionals and proactive entrepreneurs who are cognizant of our rich cultural heritage.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'VISION',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'The University of Nueva Caceres, a private non-sectarian institution, is Bicol\'s first university. Guided by its motto, "Non Scholae Sed Vitae" (Not of school but of life), and attuned to the demands of a highly dynamic global environment, the University commits itself to quality and excellent education for all to transform the youth into entrepreneurial, productive, morally upright, socially responsible professionals for a just, humane and progressive society.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Bottom Design
              BottomDesign(),
            ],
          ),
        ),
      ),
    );
  }
}

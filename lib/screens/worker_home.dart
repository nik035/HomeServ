import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manpower_management_app/authentication/employee_signin.dart';
import 'package:manpower_management_app/screens/Worker_work.dart';
import 'package:manpower_management_app/screens/worker_profile.dart';
import 'package:manpower_management_app/screens/worker_register.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  // Initialize some dummy data
  String imageUrl='https://www.movingsolutions.in/blog/wp-content/uploads/2019/01/moving-solutions-general-pic.jpg';
  List<JobPost> _jobPosts = [
    JobPost(
        title: 'Carpentry',
        description: 'We are looking for a Carpenter to join our team',
        location: 'Remote',
        requirements: ['Experience', 'Strong skills']),
    JobPost(
        title: 'Shifting',
        description: 'We are looking for a talented Shifting to join our team',
        location: 'Remote',
        requirements: ['Proficient in Shifting', 'Experience with Shifting skills']),
    JobPost(
        title: 'Cleaning',
        description: 'We are looking for a talented Cleaning to join our team',
        location: 'Remote',
        requirements: ['Proficient in Cleaning', 'Experience with Cleaning skills']),
    JobPost(
        title: 'Cook',
        description: 'We are looking for a talented Cooking to join our team',
        location: 'Remote',
        requirements: ['Proficient in Cooking', 'Experience with Cooking skills']),
    JobPost(
        title: 'Driver',
        description: 'We are looking for a talented Driver to join our team',
        location: 'Remote',
        requirements: ['Proficient in Driver', 'Experience with Driving skills']),
    JobPost(
        title: 'Plumbing',
        description: 'We are looking for a talented plumber to join our team',
        location: 'Remote',
        requirements: ['Proficient in Plumbing', 'Experience with Plumbing skills']),
    JobPost(
        title: 'Painting',
        description: 'We are looking for a talented Painter to join our team',
        location: 'Remote',
        requirements: ['Proficient in Painting', 'Experience with Painting skills']),
    JobPost(
        title: 'Electricals',
        description: 'We are looking for a talented Electrician to join our team',
        location: 'Remote',
        requirements: ['Proficient in Electricals', 'Experience with Electricals skills']),
    JobPost(
        title: 'Carpentery',
        description: 'We are looking for a talented carpenter to join our team',
        location: 'Remote',
        requirements: ['Proficient in Carpentery', 'Experience with Carpentery skills']),
    JobPost(
        title: 'Bathing',
        description: 'We are looking for a talented Plumber to join our team',
        location: 'Remote',
        requirements: ['Proficient in Bathing tools', 'Experience']),
    JobPost(
        title: 'Roofing',
        description: 'We are looking for a talented worker to join our team',
        location: 'Remote',
        requirements: ['Proficient in Roofing', 'Experience with Roofing skills']),
    JobPost(
        title: 'Pest control',
        description: 'We are looking for a talented Worker to join our team',
        location: 'Remote',
        requirements: ['Proficient', 'Experience']),
    JobPost(
        title: 'Appliances',
        description: 'We are looking for a plumber to join our team',
        location: 'Remote',
        requirements: ['Experience', 'Familiarity with plumbing']),
    JobPost(
        title: 'Housemaid',
        description: 'We are looking for a Housemaid',
        location: 'Remote',
        requirements: ['Proficient in working at home', 'Experience']),
    JobPost(
        title: 'Babysitter',
        description: 'We are looking for a Babysitter',
        location: 'Remote',
        requirements: ['Proficient in working at home', 'Experience'])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Posts'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.work_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeWorkPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _jobPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return JobPostCard(jobPost: _jobPosts[index]);
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
              ),
              child: Text(
                "All Home Service",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServicePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmployeeProfile(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text("Register"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationForm(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text("Works"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmployeeWorkPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmployeeLogin(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class JobPost {
  final String title;
  final String description;
  final String location;
  final List<String> requirements;

  JobPost({required this.title, required this.description, required this.location, required this.requirements});
}

class JobPostCard extends StatelessWidget {
  final JobPost jobPost;

  const JobPostCard({required this.jobPost});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jobPost.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              jobPost.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Location: ${jobPost.location}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Requirements:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: jobPost.requirements.map((requirement) {
                return Text('- $requirement');
              }).toList(),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm'),
                      content: Text('Are you sure you want to proceed with same details?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Yes'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Fluttertoast.showToast(
                                msg: "You have applied",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.grey[800],
                                textColor: Colors.white,
                                fontSize: 16.0
                            );

                          },
                        ),
                        TextButton(
                          child: Text('New details'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationForm(),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );

              },
              child: Text('Apply Now'),
            ),
          ],
        ),
      ),
    );
  }
}


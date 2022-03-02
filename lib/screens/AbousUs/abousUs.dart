import 'package:flutter/material.dart';
import 'package:football_app/Utils/constants.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimeColor,
        title: const Text(
          "About Application",
          style: TextStyle(
            color: kLightColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _buildInfo1(),
            _buildInfo2(),
            _buildInfo3(),
            _buildInfo4(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo1() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    height: 70,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Sports Talent Scout',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.info),
                title: Text("Version"),
                subtitle: Text("1.0"),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.cached),
                title: Text("Changelog"),
              ),
              const Divider(),
              const ListTile(
                  leading: Icon(Icons.offline_pin), title: Text("License")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfo2() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Author',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Omar & Nabil"),
                subtitle: Text("Syria"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.file_download),
                title: Text("Download From Cloud"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfo3() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Company',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text("IT-SMART"),
                subtitle: Text("Mobile App Specialist"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text("Syria , Damascus"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfo4() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Info',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Image.asset(
                  "assets/images/email.png",
                  color: kDarkLightColor,
                  height: 20,
                ),
                title: Text("Contact@SportsTalentScout.com"),
              ),
              Divider(),
              ListTile(
                leading: Image.asset(
                  "assets/images/instagram.png",
                  color: kDarkLightColor,
                  height: 20,
                ),
                title: Text("@TheSportsTalentScout"),
              ),
              Divider(),
              ListTile(
                leading: Image.asset(
                  "assets/images/facebook.png",
                  color: kDarkLightColor,
                  height: 20,
                ),
                title: Text("Sports Talent Scout"),
              ),
              Divider(),
              ListTile(
                leading: Image.asset(
                  "assets/images/whatsapp.png",
                  color: kDarkLightColor,
                  height: 20,
                ),
                title: Text("+61411602095"),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  "assets/images/twitter.png",
                  color: kDarkLightColor,
                  height: 20,
                ),
                title: const Text("The_SportsScout"),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  "assets/images/web.png",
                  color: kDarkLightColor,
                  height: 20,
                ),
                title: Text("www.SportsTalentScout.com"),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  "assets/images/tiktok.png",
                  color: kDarkLightColor,
                  height: 20,
                ),
                title: const Text("@thesportstalentscout"),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  "assets/images/youtube.png",
                  color: kDarkLightColor,
                  height: 20,
                ),
                title: const Text("The Sports Talent Scout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

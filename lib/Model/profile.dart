import 'package:get/get.dart';

class ProfileDetailData {
  ProfileDetailData(
      {this.pos,
      this.dob,
      this.passport,
      this.occupation,
      this.email,
      this.fb,
      this.insta,
      this.whatsapp,
      this.league,
      this.record,
      this.id,
      this.image,
      this.name,
      this.sportName,
      this.flag,
      this.height,
      this.weight,
      this.age,
      this.country,
      this.inWishList});

  final int? id;
  RxBool? inWishList;
  final String? image;
  final String? country;
  final String? age;
  final String? name;

  final String? sportName;

  final String? height;
  final String? weight;

  final String? flag;
  final String? pos;
  final String? dob;
  final String? passport;
  final String? occupation;
  final String? email;
  final String? fb;
  final String? insta;
  final String? whatsapp;
  final String? league;
  final String? record;

  // ignore: non_constant_identifier_names
  static List<ProfileDetailData> Details = <ProfileDetailData>[
    ProfileDetailData(
      id: 1,
      age: " 19",
      image: "assets/images/cr7.jpg",
      name: 'Cristiano Ronaldo',
      country: "Brazillain",
      occupation: "Professional Footballer",
      dob: "05/02/1985",
      sportName: "Professional Footballer",
      flag: "assets/images/ronaldoflag.jpg",
      height: "6 ft 2 in",
      weight: "85 kg",
      pos: "Forward",
      passport: "",
      email: "ronaldo@gmail.com",
      whatsapp: "+1817171717",
      insta: "@ronaldo11",
      fb: "Ronaldo christian",
      league: "Manchester United",
      record:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare.',
    ),
    ProfileDetailData(
      country: "Nigera",
      id: 2,
      age: " 21",
      image: "assets/images/messi.jpg",
      name: 'Lionel Messi',
      occupation: "Footballer",
      height: "5 ft 7 in",
      weight: "75 kg",
      dob: "19/09/2000",
      sportName: "Professional Footballer",
      flag: "assets/images/messiflag.jpg",
      pos: "Forward",
      passport: "",
      email: "messi@gmail.com",
      whatsapp: "+1817171717",
      insta: "@ronaldo11",
      fb: "Lionel Messi",
      league: "Rubgy League",
      record:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare.',
    ),
    ProfileDetailData(
      country: "Unitd states",
      id: 3,
      age: " 25",
      image: "assets/images/ronaldo.jfif",
      name: 'Lebron James',
      occupation: "Student / year nine",
      dob: "19/09/2000",
      sportName: "Rubgy league",
      flag: "assets/images/france.png",
      pos: "Lock | 2nd Row",
      height: "6 ft 2 in",
      weight: "85 kg",
      passport: "",
      email: "ronaldo@gmail.com",
      whatsapp: "+1817171717",
      insta: "@ronaldo11",
      fb: "Ronaldo christian",
      league: "Rubgy League Vietnam",
      record:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare.',
    ),
    ProfileDetailData(
      country: "England",
      age: " 27",
      id: 4,
      image: "assets/images/ronaldo.jfif",
      name: 'Game',
      occupation: "Student / year nine",
      dob: "19/09/2000",
      sportName: "Rubgy league",
      flag: "assets/images/france.png",
      pos: "Lock | 2nd Row",
      passport: "",
      height: "6 ft 2 in",
      weight: "85 kg",
      email: "ronaldo@gmail.com",
      whatsapp: "+1817171717",
      insta: "@ronaldo11",
      fb: "Ronaldo christian",
      league: "Rubgy League Vietnam",
      record:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare.',
    ),
    ProfileDetailData(
      country: "Pakistani",
      age: " 19",
      id: 5,
      image: "assets/images/ronaldo.jfif",
      name: 'Game',
      occupation: "Student / year nine",
      dob: "19/09/2000",
      sportName: "Rubgy league",
      flag: "assets/images/france.png",
      pos: "Lock | 2nd Row",
      passport: "",
      height: "6 ft 2 in",
      weight: "85 kg",
      email: "ronaldo@gmail.com",
      whatsapp: "+1817171717",
      insta: "@ronaldo11",
      fb: "Ronaldo christian",
      league: "Rubgy League Vietnam",
      record:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare.',
    ),
    ProfileDetailData(
      country: "Pakistani",
      id: 6,
      age: " 22",
      height: "6 ft 2 in",
      weight: "85 kg",
      image: "assets/images/ronaldo.jfif",
      name: 'Game',
      occupation: "Student / year nine",
      dob: "19/09/2000",
      sportName: "Rubgy league",
      flag: "assets/images/france.png",
      pos: "Lock | 2nd Row",
      passport: "",
      email: "ronaldo@gmail.com",
      whatsapp: "+1817171717",
      insta: "@ronaldo11",
      fb: "Ronaldo christian",
      league: "Rubgy League Vietnam",
      record:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare.',
    ),
    ProfileDetailData(
      country: "Pakistani",
      id: 7,
      image: "assets/images/ronaldo.jfif",
      name: 'Game',
      age: "25",
      occupation: "Student / year nine",
      dob: "19/09/2000",
      height: "6 ft 2 in",
      weight: "85 kg",
      sportName: "Rubgy league",
      flag: "assets/images/france.png",
      pos: "Lock | 2nd Row",
      passport: "",
      email: "ronaldo@gmail.com",
      whatsapp: "+1817171717",
      insta: "@ronaldo11",
      fb: "Ronaldo christian",
      league: "Rubgy League Vietnam",
      record:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare.',
    ),
    ProfileDetailData(
      country: "Pakistani",
      age: "23",
      id: 8,
      image: "assets/images/ronaldo.jfif",
      name: 'Game',
      occupation: "Student / year nine",
      dob: "19/09/2000",
      sportName: "Rubgy league",
      flag: "assets/images/france.png",
      pos: "Lock | 2nd Row",
      passport: "",
      height: "6 ft 2 in",
      weight: "85 kg",
      email: "ronaldo@gmail.com",
      whatsapp: "+1817171717",
      insta: "@ronaldo11",
      fb: "Ronaldo christian",
      league: "Rubgy League Vietnam",
      record:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare.',
    ),
    ProfileDetailData(
      country: "Pakistani",
      age: "29",
      id: 9,
      image: "assets/images/ronaldo.jfif",
      name: 'Game',
      occupation: "Student / year nine",
      dob: "19/09/2000",
      sportName: "Rubgy league",
      flag: "assets/images/france.png",
      pos: "Lock | 2nd Row",
      passport: "",
      email: "ronaldo@gmail.com",
      whatsapp: "+1817171717",
      insta: "@ronaldo11",
      fb: "Ronaldo christian",
      height: "6 ft 2 in",
      weight: "85 kg",
      league: "Rubgy League Vietnam",
      record:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare.',
    ),
  ];
}

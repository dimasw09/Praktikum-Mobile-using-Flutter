class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final String? profileImage;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    this.profileImage,
    this.phoneNumber,
  });

  factory User.dummy() {
    return User(
      id: 027,
      name: "Dimas Wahyudi",
      userName: "Dimass",
      email: "2006132@itg.ac.id",
      profileImage:
          "https://scontent.fbdo1-1.fna.fbcdn.net/v/t39.30808-6/305018979_605846424223993_304249551851919614_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGAEbCH6syTFrAz_GjRv0CNB0w_yJHkpPgHTD_IkeSk-Mf0tGP44oNsuc5RC1C4LjqPk9B7Fpdzx2GsBOh0pte-&_nc_ohc=BM_f_92UsWkAX-3_k7F&_nc_zt=23&_nc_ht=scontent.fbdo1-1.fna&oh=00_AfAYbRFvnJTYaRUK0UQawnRPTIaQ88-OcY-xvXSblKw8Yg&oe=642A2FDC",
      phoneNumber: "082124562992",
    );
  }
}

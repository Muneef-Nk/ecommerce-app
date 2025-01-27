import 'package:ecommerce_application/core/constants/color_constants.dart';
import 'package:ecommerce_application/core/utils/helper_function.dart';
import 'package:ecommerce_application/features/profile/view/widgets/profile_container.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var name;
  var email;
  var photo;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    name = await getName();
    email = await getEmail();
    photo = await getProfile();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      photo == ''
                          ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                          : photo,
                    )),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColor.primary,
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 15,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '$name',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$email',
              style: TextStyle(
                fontSize: 16,
                color: AppColor.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ProfileContainer(
              icon: Icons.favorite_border,
              title: 'Wish List',
              onTap: () {},
            ),
            ProfileContainer(
              icon: Icons.history,
              title: 'Order History',
              onTap: () {},
            ),
            ProfileContainer(
              icon: Icons.location_on_outlined,
              title: 'Address',
              onTap: () {},
            ),
            ProfileContainer(
              icon: Icons.credit_card_outlined,
              title: 'Payment Methods',
              onTap: () {},
            ),
            ProfileContainer(
              icon: Icons.logout,
              title: 'Log out',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

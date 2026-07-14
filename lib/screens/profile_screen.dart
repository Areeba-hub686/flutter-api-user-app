import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFB),
      appBar: AppBar(
        title: const Text(
          "User Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF009688),
                Color(0xFF00BCD4),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF009688),
                    Color(0xFF00BCD4),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),

              child: Column(
                children: [
                  Hero(
                    tag: user.id,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://ui-avatars.com/api/?name=${Uri.encodeComponent(user.name)}&background=ffffff&color=009688&size=256',
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    user.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    user.email,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),


            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildInfoCard(
                    icon: Icons.person_outline,
                    title: "Username",
                    value: user.username,
                  ),

                  _buildInfoCard(
                    icon: Icons.email_outlined,
                    title: "Email",
                    value: user.email,
                  ),

                  _buildInfoCard(
                    icon: Icons.phone_outlined,
                    title: "Phone",
                    value: user.phone,
                  ),

                  _buildInfoCard(
                    icon: Icons.language_outlined,
                    title: "Website",
                    value: user.website,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {

    return Container(

      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF00BCD4).withOpacity(0.25),
          width: 1.2,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),

        ],

      ),


      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        child: Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE0F7F7),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(
                icon,
                color: const Color(0xFF009688),
                size: 25,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),

                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),


            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: const Color(0xFFE0F7F7),
                borderRadius: BorderRadius.circular(10),
              ),

              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Color(0xFF009688),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
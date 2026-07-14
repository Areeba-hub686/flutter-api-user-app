import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();

  late Future<List<User>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = _apiService.fetchUsers();
  }

  Future<void> _refreshUsers() async {
    setState(() {
      _usersFuture = _apiService.fetchUsers();
    });

    await _usersFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF4FBFB),

        appBar: AppBar(
          toolbarHeight: 95,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,

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

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),

          title: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "API Users",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 4),

              Text(
                "Explore API User Profiles",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),

        body: FutureBuilder<List<User>>(
            future: _usersFuture,
            builder: (context, snapshot) {

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Color(0xFF009688),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Fetching Users...",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Please wait a moment",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wifi_off_rounded,
                          size: 90,
                          color: Colors.grey.shade500,
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Connection Failed",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Please check your internet connection and try again.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 25),

                        ElevatedButton.icon(
                          onPressed: _refreshUsers,
                          icon: const Icon(Icons.refresh),
                          label: const Text("Retry"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF009688),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_outline_rounded,
                        size: 90,
                        color: Colors.grey,
                      ),

                      SizedBox(height: 20),

                      Text(
                        "No Users Found",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        "Pull down to refresh",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }

              final users = snapshot.data!;
              return RefreshIndicator(
                color: const Color(0xFF009688),
                onRefresh: _refreshUsers,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Hero(
                        tag: user.id,
                        child: Card(
                          elevation: 4,
                          shadowColor: Colors.black12,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(18),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProfileScreen(user: user),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [

                                  CircleAvatar(
                                    radius: 32,
                                    backgroundColor: const Color(0xFFE0F7F7),
                                    child: Text(
                                      user.name[0].toUpperCase(),
                                      style: const TextStyle(
                                        color: Color(0xFF009688),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 16),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          user.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        Row(
                                          children: [

                                            const Icon(
                                              Icons.email_outlined,
                                              size: 16,
                                              color: Color(0xFF009688),
                                            ),

                                            const SizedBox(width: 6),

                                            Expanded(
                                              child: Text(
                                                user.email,
                                                maxLines: 1,
                                                overflow:
                                                TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 10),

                                        Container(
                                          padding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                            const Color(0xFFE0F7F7),
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            "@${user.username}",
                                            style: const TextStyle(
                                              color:
                                              Color(0xFF009688),
                                              fontWeight:
                                              FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF009688),
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
        ),
    );
  }
}
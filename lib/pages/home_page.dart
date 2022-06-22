import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:jobin_app/models/category_model.dart';
import 'package:jobin_app/models/job_model.dart';
import 'package:jobin_app/theme/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howdy,',
                      style: subtitle.copyWith(color: secondary),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        'Afiv Dicky Efendy',
                        style: title,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 10, left: 24, right: 24),
            child: Text(
              'Categories',
              style: title.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w400, color: darkColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: FutureBuilder<List<CategoryModel>>(
                        future: getCategory(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: snapshot.data!
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Container(
                                        height: 200,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          color: secondary,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                            image: NetworkImage(e.imageUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            bottom: 10,
                                          ),
                                          child: Text(
                                            e.name,
                                            style: subtitle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
            child: Text(
              'Just Posted',
              style: title.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w400, color: darkColor),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<JobModel>>(
                future: getJob(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView(
                        padding: const EdgeInsets.only(left: 10, top: 4),
                        children: snapshot.data!
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: ListTile(
                                    leading: Image.network(e.companyLogo),
                                    title: Text(e.name),
                                    subtitle: Text(e.companyName),
                                  ),
                                ))
                            .toList());
                  }
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => const ProfileShimmer(
                      padding: EdgeInsets.only(left: 15, right: 24),
                    ),
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: const Color(0xff272C2F),
        unselectedItemColor: secondary,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/nav1.png'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/nav2.png'),
              ),
              label: 'Notifications'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/nav3.png'),
              ),
              label: 'Favorite'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/nav4.png'),
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_project/app/modules/profil/controllers/profil_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  _ProfilViewState createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> with TickerProviderStateMixin {
  
  final ProfilController controller = Get.put(ProfilController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                    ),
                    Text(
                      "${controller.user['data']['name']}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _logout();
                      },
                      icon: Icon(
                        Icons.output_rounded,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOxJoocm8iCqlsBLrE4HvMf23xnryxgXobSw&usqp=CAU"),
                radius: 70,
              ),
              SizedBox(height: 15),
              Text(
                "${controller.user['data']['email']}",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 5),
                  Column(
                    children: [
                      Text(
                        "1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Mengkuti",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "1.6Jt",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Pengikut",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "5.6Jt",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Menyukai",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Edit Profil",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(120, 50),
                  primary: Colors.grey.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'No bio yet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                controller: controller.tabController,
                indicator: BoxDecoration(borderRadius: BorderRadius.zero),
                labelColor: Colors.black,
                labelStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                unselectedLabelColor: Colors.black45,
                onTap: (tapIndex) {
                  setState(() {
                    controller.selectedIndex = tapIndex;
                  });
                },
                tabs: [
                  Tab(text: "Template"),
                  Tab(text: "Foto"),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                Center(
                  child: Text("You don't have any template"),
                ),
                Center(
                  child: Text("You don't have any foto"),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
  void _logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    localStorage.remove('token');
    localStorage.remove('user');

    Get.offAllNamed('/login');
  }
}
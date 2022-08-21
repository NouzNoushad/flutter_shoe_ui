import 'package:flutter/material.dart';
import 'package:flutter_shoes_ui/details.dart';
import 'package:flutter_shoes_ui/explore.dart';
import 'package:flutter_shoes_ui/model/popular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // controller
  late final TabController _tabController = TabController(
    length: 4,
    vsync: this,
  );
  // List of popular brands
  List<Brands> brands = BrandsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shoeAppBar(),
            adContainer(),
            const Text(
              "Popular Brands",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              labelPadding: EdgeInsets.zero,
              indicatorColor: Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              tabs: [
                tabContainers("All"),
                tabContainers("Nike"),
                tabContainers("Adidas"),
                tabContainers("Puma"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  popularBrands(),
                  const Center(
                    child: Text("Nike"),
                  ),
                  const Center(
                    child: Text("Adidas"),
                  ),
                  const Center(
                    child: Text("Puma"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget popularBrands() => ListView.builder(
        // create shoes data models
        itemCount: brands.length,
        itemBuilder: (context, index) {
          final brand = brands[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => BrandDetails(brand: brand)),
              );
            },
            child: Container(
              height: 220,
              // color: Colors.yellow,
              padding: const EdgeInsets.only(left: 18, right: 18),
              margin: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade700,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "New Arrival",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              brand.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "\$${brand.price}",
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: -40,
                    child: Transform(
                      transform: Matrix4.rotationZ(-0.5),
                      child: Container(
                        height: 160,
                        width: 260,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/${brand.image}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 18,
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.lightBlue,
                            Colors.deepPurple.shade700,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  Widget tabContainers(String text) => Container(
        height: 36,
        width: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
        ),
      );

  Widget adContainer() => Container(
        height: 190,
        // color: Colors.yellow,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 160,
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.lightBlue,
                      Colors.deepPurple.shade700,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 160,
                      child: const Text(
                        "Make Foot Awesome With Nice Air",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 40,
                          width: 130,
                          child: TextButton(
                            onPressed: () {
                              // take me to explore page
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const ExploreNike()),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(14),
                              backgroundColor: Colors.lightBlueAccent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Explore Nike",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.asset(
                                  "assets/Nike.png",
                                  height: 8,
                                  width: 25,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: 200,
                width: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/nike_ad.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget shoeAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.blue,
                  image: const DecorationImage(
                    image: AssetImage("assets/profile3.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Montha Alex",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(Icons.notifications_outlined, size: 20),
        ],
      );
}

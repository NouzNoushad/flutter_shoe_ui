import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_shoes_ui/model/popular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExploreNike extends StatefulWidget {
  const ExploreNike({Key? key}) : super(key: key);

  @override
  State<ExploreNike> createState() => _ExploreNikeState();
}

class _ExploreNikeState extends State<ExploreNike> {
  // list of popular brands from model
  List<Brands> brands = BrandsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          children: [
            exploreAppBar(),
            Expanded(
              child: ListView.builder(
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  final brand = brands[index];
                  return Container(
                    height: 120,
                    // slidable
                    child: Slidable(
                      startActionPane: ActionPane(
                        motion: const StretchMotion(),
                        extentRatio: 0.2,
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            icon: Icons.share,
                            borderRadius: BorderRadius.circular(10),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            spacing: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // take max space
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 10,
                                  top: 15,
                                  child: Container(
                                    height: 90,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple.shade700,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 40,
                                  child: Transform(
                                    transform: Matrix4.rotationZ(-0.5),
                                    child: Container(
                                      height: 80,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/${brand.image}"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 160,
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  brand.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$${brand.price}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    RatingBar.builder(
                                      itemSize: 12,
                                      itemCount: 5,
                                      allowHalfRating: true,
                                      initialRating: brand.rating,
                                      onRatingUpdate: (rating) {
                                        setState(() {
                                          brand.rating = rating;
                                        });
                                      },
                                      itemBuilder: (context, _) {
                                        return const Icon(Icons.star,
                                            color: Colors.amber);
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 70,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: const Text(
                                          "Add to Cart",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 25,
                                      width: 70,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: const Text(
                                          "Buy Now",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget exploreAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context); // take back to home
              },
              child: const Icon(Icons.arrow_back, size: 20)),
          const Text(
            "Explore",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Icon(Icons.notifications_outlined, size: 20),
        ],
      );
}

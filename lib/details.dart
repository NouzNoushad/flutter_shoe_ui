import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_shoes_ui/model/popular.dart';

class BrandDetails extends StatefulWidget {
  final Brands brand;
  const BrandDetails({Key? key, required this.brand}) : super(key: key);

  @override
  State<BrandDetails> createState() => _BrandDetailsState();
}

class _BrandDetailsState extends State<BrandDetails> {
  List<int> sizes = [
    for (var i = 3; i <= 15; i++) i
  ]; // create numbers from 3 to 15
  List<Color> colors = [
    Colors.black,
    Colors.yellow,
    Colors.greenAccent,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerContainer(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.brand.longName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Build For Natural, Motion, The Shoe Brands",
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  Row(
                    children: [
                      // flutter rating bar
                      RatingBar.builder(
                        itemCount: 5,
                        itemSize: 16,
                        allowHalfRating: true,
                        initialRating: widget.brand.rating,
                        onRatingUpdate: (rating) {
                          setState(() {
                            widget.brand.rating = rating;
                          });
                        },
                        itemBuilder: (context, _) {
                          return const Icon(Icons.star, color: Colors.amber);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.brand.rating.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Sneaker Size",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      // create size list
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(right: 10),
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              // i am using button style because i need overlay color
                              overlayColor: MaterialStateProperty.all(Colors
                                  .deepPurple.shade700), // overlay color effect
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: Text(
                              sizes[index].toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Colors Available: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 160,
                        child: ListView.builder(
                          // create colors data
                          scrollDirection: Axis.horizontal,
                          itemCount: colors.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: colors[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "\$${widget.brand.price.toString()}",
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 210,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "As you Know, there are many factors that go into a successful trade show marketing program",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                "More Details",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerContainer() => Container(
        height: 320,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlue,
              Colors.deepPurple.shade700,
            ],
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Wrap(
          runSpacing: 30,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.white,
              ),
            ),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/${widget.brand.image}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
}

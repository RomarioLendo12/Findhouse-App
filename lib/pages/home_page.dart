import 'package:bwa_findhouse/models/city.dart';
import 'package:bwa_findhouse/models/space.dart';
import 'package:bwa_findhouse/models/tips.dart';
import 'package:bwa_findhouse/providers/space_provider.dart';
import 'package:bwa_findhouse/theme.dart';
import 'package:bwa_findhouse/widgets/bottom_navbar_item.dart';
import 'package:bwa_findhouse/widgets/city_card.dart';
import 'package:bwa_findhouse/widgets/space_card.dart';
import 'package:bwa_findhouse/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            // NOTE: TITLE/HEADER
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),

            SizedBox(
              height: 30,
            ),
            // NOTE: POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular City',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: edge,
                  ),
                  CityCard(City(
                    id: 1,
                    name: 'Jakarta',
                    imageUrl: 'assets/images/city1.png',
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city2.png',
                      isPopular: true)),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                    id: 3,
                    name: 'Surabaya',
                    imageUrl: 'assets/images/city3.png',
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                    id: 4,
                    name: 'Palembang',
                    imageUrl: 'assets/images/city4.png',
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/images/city5.png',
                      isPopular: true)),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                    id: 6,
                    name: 'Bogor',
                    imageUrl: 'assets/images/city6.png',
                  )),
                  SizedBox(
                    width: edge,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpace(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;
                    int index = 0;
                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            // NOTE: TIPS & GUIDANCE
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(Tips(
                      id: 1,
                      name: 'City Guidelines',
                      imageUrl: 'assets/images/tips1.png',
                      update: 'Updated 20 April')),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                      id: 2,
                      name: 'Jakarta Fairship',
                      imageUrl: 'assets/images/tips2.png',
                      update: 'Updated 11 Dec'))
                ],
              ),
            ),
            SizedBox(
              height: 60 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: Color(0xfff6f7f8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_love.png',
              isActive: false,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

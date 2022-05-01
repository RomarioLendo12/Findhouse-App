import 'package:bwa_findhouse/pages/error_page.dart';
import 'package:bwa_findhouse/theme.dart';
import 'package:bwa_findhouse/widgets/facility_item.dart';
import 'package:bwa_findhouse/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bwa_findhouse/models/space.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }
    // launchUrl(String url) async {
    //   if (await canLaunch(url)) {
    //     launch(url);
    //   } else {
    //     // throw (url);
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => ErrorPage(),
    //       ),
    //     );
    //   }
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                widget.space.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 328,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        // NOTE: TITLE
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.space.name,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text.rich(TextSpan(
                                      text: '\$${widget.space.price} ',
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: '/ month',
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16))
                                      ]))
                                ],
                              ),
                              // SizedBox(
                              //   width: 40,
                              // ),
                              Row(
                                  children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                      index: index,
                                      rating: widget.space.rating),
                                );
                              }).toList())
                            ],
                          ),
                        ),
                        // NOTE: MAIN FACILITIES
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Main Facilities',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                imageUrl: 'assets/images/icon_kitchen.png',
                                jumlah: widget.space.numberOfKithcens,
                                nama: 'kitchen',
                              ),
                              FacilityItem(
                                  imageUrl: 'assets/images/icon_bedroom.png',
                                  jumlah: widget.space.numberOfBedrooms,
                                  nama: 'bedroom'),
                              FacilityItem(
                                  imageUrl: 'assets/images/icon_cupboard.png',
                                  jumlah: widget.space.numberOfCupboards,
                                  nama: 'Big Lemari'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Text(
                            'Photos',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        // NOTE: PHOTOS
                        Container(
                          height: 88,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: widget.space.photos.map((item) {
                                return Container(
                                  margin: EdgeInsets.only(left: edge),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      item,
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList()),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // NOTE: LOCATION
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Text(
                            'Location',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.space.address}\n${widget.space.city}',
                                style: greyTextStyle,
                              ),
                              InkWell(
                                onTap: () {
                                  launchUrl(widget.space.mapUrl);
                                },
                                child: Image.asset(
                                  'assets/images/btn_map.png',
                                  width: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: edge),
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            color: purpleColor,
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Konfirmasi'),
                                content: const Text(
                                    'Apakah kamu ingin menelepon pemilik kost?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Batal'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        launchUrl('tel:${widget.space.phone}'),
                                    child: const Text('Telephone'),
                                  ),
                                ],
                              ),
                            ),
                            // {
                            //   launchUrl('tel:${widget.space.phone}');
                            // },
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: edge),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/btn_back.png',
                        width: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      child: Image.asset(
                        isClicked
                            ? 'assets/images/btn_wishlist_true.png'
                            : 'assets/images/btn_wishlist.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key, this.id=1});

  final int id;

  Future<Map<String, dynamic>> fetchData() async {
    try {
      Dio dio = Dio();
      final response =
          await dio.get('https://easyenglishuzb.free.mockoapp.net/companies/$id');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Info'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Text('No data');
          } else {
            final companyData = snapshot.data!;
            return Column(
              children: [
                CarouselSlider(
                  items: [
                    ...List.generate(
                      companyData["car_pics"].length,
                      (index) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: CachedNetworkImage(
                            imageUrl: companyData["car_pics"][index],
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              height: 70,
                              width: 70,
                              imageUrl: companyData["logo"],
                              errorWidget: (context, url, error) => const Center(
                                child: Icon(Icons.image_not_supported,size: 40,)
                              ),
                            ),
                            Text('Car Model: ${companyData["car_model"]}'),
                            Text('Year: ${companyData["established_year"]}'),
                            Text('Price: ${companyData["average_price"]}\n'),
                            Text('Description:\n\n  ${companyData["description"]}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/ui/screens/screen_three.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  Future<List<dynamic>> fetchData() async {
    try {
      Dio dio = Dio();
      final response =
          await dio.get('https://easyenglishuzb.free.mockoapp.net/companies');

      if (response.statusCode == 200) {
        return response.data['data'];
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
        title: const Text('Cars'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Text('No data');
          } else {
            final companiesData = snapshot.data!;
            return ListView.builder(
              itemCount: companiesData.length,
              itemBuilder: (context, index) {
                final company = companiesData[index];

                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenThree(
                            id: company["id"],
                          ),
                        ),
                      );
                    },
                    title: Text('Company Name: ${company["car_model"]}'),
                    subtitle: Text('Year: ${company["established_year"]}'),
                    leading: CachedNetworkImage(
                      height: 50,
                      width: 50,
                      imageUrl: company["logo"],
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.image_not_supported,size: 30),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

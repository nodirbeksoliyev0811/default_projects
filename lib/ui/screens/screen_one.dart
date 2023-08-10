import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  Future<List<dynamic>> fetchData() async {
    try {
      Dio dio = Dio();
      final response = await dio.get(
          'https://easyenglishuzb.free.mockoapp.net/countries');
      if (response.statusCode == 200) {
        return response.data['data']['countries'];
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
        title: const Text('Countries'),
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
            final countriesData = snapshot.data!;
            return ListView.builder(
              itemCount: countriesData.length,
              itemBuilder: (context, index) {
                final country = countriesData[index];
                return ListTile(
                  onTap: (){},
                  leading: Text(country["emoji"],style: const TextStyle(fontSize: 40),),
                  title: Text('${country["name"]} [ ${country["capital"]} ]'),
                  subtitle: Text('Code: ${country["code"]},  Phone: +${country["phone"]},\nContinent code: ${country["continent"]["code"]}, ${country["continent"]["name"]}'),
                  trailing: Text('${country["currency"]}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

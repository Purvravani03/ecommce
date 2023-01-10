import 'dart:convert';

import 'package:ecommce/productpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List image = [
    "Old_Electronics_hero_1.jpg",
    "Sumangali-Jewellery-Collection-o1.jpg",
    "10000.jpeg",
    "wedding-lehenga.jpg"
  ];

  Future<List> get_categories() async {
    var url = Uri.parse('https://fakestoreapi.com/products/categories');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List list = jsonDecode(response.body);
    print(list);
    return list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    get_categories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("E-commerce"),
      ),
      body: Column(children: [
        Text("Categories"),
        Expanded(
          child: FutureBuilder(
            future: get_categories(),
            builder: (context, snapshot) {
              print(snapshot.connectionState);
              if(snapshot.connectionState==ConnectionState.waiting)
              {
                return Center(child: CircularProgressIndicator(),);
              }
              else
              {
                List? l=snapshot.data;
                return ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${l[index]}"),
                    leading: Image(height: 100,width:100,image: AssetImage("image/${image[index]}")),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return productoage(l[index]);
                      },));
                    },
                  );
                },itemCount: l!.length,);
              }
            },
          ),
        )
    

      ]),
    );
  }
}

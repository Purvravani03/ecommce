import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class productDetails extends StatefulWidget {
  Map m;

  productDetails(this.m);

  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  double rate = 0;
  int review = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rate = widget.m['rating']['rate'];
    review = widget.m['rating']['count'];
    rate = rate.toDouble();
    print(rate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("description"),
      ),
      body: Column(
        children: [
          Text("${widget.m['title']}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          RatingBar.builder(
            initialRating: rate,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star_border_purple500,
              color: Colors.deepPurple,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Text("$review Reviews"),
          Expanded(
              child: Image.network(
            "${widget.m['image']}",
            height: 200,
            width: 200,
          )),
          Expanded(child: Text("${widget.m['description']}")),
          Expanded(child: Text("dollar:${widget.m['price']}")),
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
          style: ButtonStyle(alignment: Alignment.center,
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(10))))),
                    onPressed: () {}, child: Text("ADD TO KART")),
              ),
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                    onPressed: () {},
                    child: Text("BUY")),
              )
            ],
          )
        ],
      ),
    );
  }
}

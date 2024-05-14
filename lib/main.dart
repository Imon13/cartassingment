import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCart(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final List<String> Productname = ['Pullover', 'Sports', 'tShirt'];
  final List<String> Productimage = [
    'https://s3-alpha-sig.figma.com/img/6e2a/6075/d2aebb9b52db31deea621f309362bab4?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=g56LRANcTKnqj2EF8wBDcJWCNQnmv4kXtTH-tjg7diUp7dJTP~rJsLHycZuHJhGkFX7JwZPyA8l8ff8Ql5ankjgGuwiQ1VeZdOt8GDX3c~iLF1P1a6Odvv3ikCbCwLZf9S6D-XK~JSDX844TgxsM0p9W4j~RCE1LyjzruBAiv2mYs7UmPQOlPdZrHA-RfdHgQ3OJPxvicUhM2HXVRSvQ2lRCuJsEeiBPHCgYA9N9YKwSWFCqITWQozlm~VxF2H~yrwr-rZZeK3GLkh4n65WbSXQkJve-mcSnhztkM92kpyC9UOQikzi5evTUwaMPjzEdXz~u-kWawlEo~Bgx2KJ6Og__',
    'https://s3-alpha-sig.figma.com/img/5e93/8ec8/ffc8353c2e4119cf43ecf6db7e381d9d?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AOW41X2lZLKhWJbYWBA~lsERRXbNpPH~z8OVng-N8F1OK9gyL1PgwEUz5WBua2uuj7rW4Z92kLtSGMxgLWtkky0RpRctYr5mMHZFPTl7Tm4C8xvK51CeRgn5Nzv3kPSp1lnonfMGBFPvjWMkjONpQEo-XkRvnG9CzKA6R9~IEsx4lkPrFRlnMGsKVoWowoE0jX~mVsr~sQcINviFql2PkaWvpFXm1AjCZPRUPK8UzjtILEi7ACkdBCyJrN9cZKAApiqUDWAP~9GVERsYTqSJ6kIrlElJbsx2qtPGekHLFOf4VNyZijDLIP~l2wsjtcD35zTLMOlFpD4xeGL~j8R6IQ__',
    'https://s3-alpha-sig.figma.com/img/1821/5f62/e259b4c9081785e2fb7f4b553d1a8023?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=V2cNFYhw-GsKjP2xFh73rGAH7UQqjpryJ3n4C0A~lLqd1g8CBzjsdCHBLaEokxbgN8r5xvY74yBlit8e1oVcynIuI0IDZy0RW8WmMuL4mUqMIOFVs~QcWd9C721fHMHjKasXvTtDfnHNxDzNvF24kQ3LXdgJfa8BLGizFI-dOA1gifHxmeUFpI~iDn7KFc4zmZ2TEFxmYZk1Bq4ZiOb8xGgsOb0tcT2z7SgCrQO683uneLCqzJ3F6eyk7PGP5tux9r4oueAX4954RpYTAs5~8q13e3vDoNR83LbffgHe5gQ9~gvosnUdmmsyMX~AnY-D5ZBlIzjjHhlYUDznJ4pLWw__'
  ];
  final List<String> productcolor = ['Black', 'Gray', 'Black'];
  final List<String> producSize = ['L', 'L', 'M'];
  final List<int> productPrice = [51, 30, 40];
  List<int> productquan = [0, 0, 0]; // Initialize quantities to zero initially
  int totalPrice = 0;
  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(25),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      textStyle: TextStyle(
          color: Colors.red,
          fontSize: 24
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bag",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Productname.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          width: 100,
                          height: 100,
                          image: NetworkImage(Productimage[index]),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Productname[index],style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              ),),
                              Row(
                                children: [
                                  Text("Color: ${productcolor[index]} | "),
                                  Text("Size: ${producSize[index]}"),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _decrementQuantity(index);
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                  Text('${productquan[index]}'),
                                  IconButton(
                                    onPressed: () {
                                      _incrementQuantity(index);
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  Text(" \$${productPrice[index]}"),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Price:",
                  style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
                Text("\$$totalPrice", style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ],
            ),
          ),
          ElevatedButton(
            style: buttonStyle,
            onPressed: () {
              // Perform checkout operation here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Congratulations! Checkout Successful.',textAlign: TextAlign.center,),
                ),
              );
            },
            child: Text("Checkout",),
          ),
        ],
      ),
    );
  }

  void _incrementQuantity(int index) {
    setState(() {
      productquan[index]++;
      totalPrice += productPrice[index];
      if (productquan[index] == 5) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Congratulations!",textAlign: TextAlign.center,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),),
              content: Text('You addrd 5 \n ${Productname[index]} on your bag!',textAlign: TextAlign.center,style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300
              ),),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK",textAlign: TextAlign.center,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (productquan[index] > 0) {
        productquan[index]--;
        totalPrice -= productPrice[index];
      }
    });
  }
}

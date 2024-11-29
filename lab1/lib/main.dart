import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String imageUrl;
  final String description;
  final int price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: const Color.fromARGB(255, 238, 150, 184)),
        
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Јакна",
      imageUrl: "https://www.fashiongroup.com.mk/files/thumbs/files/images/slike-proizvoda/media/TA6/TA6HBW-001/images/thumbs_350/TA6HBW-001_350_490px.png",
      description: "Топла зимска јакна",
      price: 3000,
    ),
    Product(
      name: "Кошула",
      imageUrl: "https://milanomenswearonline.com/cdn/shop/files/vital-fashion-group-s-al-4-way-stretch-sport-shrit-sf-sport-shirt-153405-42976543342811_2400x.jpg?v=1728424511",
      description: "Кошула за секоја пригода",
      price: 1500,
    ),
    Product(
      name: "Фармерки",
      imageUrl: "https://media.boohoo.com/i/boohoo/gzz75836_light%20blue_xl/female-light%20blue-plus-basics-split-hem-straight-leg-jeans---/?w=900&qlt=default&fmt.jp2.qlt=70&fmt=auto&sm=fit",
      description: "Фармерки коишто стојат со било кое парче облека",
      price: 1300,
    ),
    Product(
      name: "Фустан",
      imageUrl: "https://www.fashiongroup.com.mk/files/watermark/files/images/slike-proizvoda/media/CKJ/CKJ20J224150-PD7/images/thumbs_w/CKJ20J224150-PD7_w_800_1120px.jpg.webp",
      description: "Фустан погоден за ладни зимски денови",
      price: 1200,
    ),
    Product(
      name: "Кожна јакна",
      imageUrl: "https://www.fashiongroupoutlet.mk/files/watermark/files/images/slike-proizvoda/media/504/50476281-001/images/thumbs_w/50476281-001_w_800_1120px.jpg",
      description: "Кожна јакна со висок квалитет, изработена од 100% кожа",
      price: 2800,
    ),
    Product(
      name: "Маица",
      imageUrl: "https://storage.googleapis.com/fga-public/2024/06/020960f0-222565_an.jpg",
      description: "Удобна црна маичка со 100% памук",
      price: 500,
    )
  ];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('211098'), // Вашиот број на индекс
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:30.0, left:10, right:10),  
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              
              color: const Color.fromARGB(255, 238, 150, 184), // Set background color for the card
              elevation: 5.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(product: products[index]),
                    ),
                  );
                },
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    Image.network(products[index].imageUrl, height: 120),

                    SizedBox(height: 8), // Adding space between image and text
                    Text(products[index].name, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("Цена: ${products[index].price} денари"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        // App bar color
      ),
      body: SingleChildScrollView( // Ensure the content is scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image with border radius and shadow
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  product.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              
              // Product name with enhanced text style
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              
              // Product description with better spacing
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5, // Improved line height for readability
                ),
              ),
              SizedBox(height: 16),
              
              // Price with a stylish font and color
              Row(
            
                children: [
                  Text(
                    "Цена: ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "${product.price} денари",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700], // Highlight price in green
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              
              // Add to cart button or any other actions
              
            ],
          ),
        ),
      ),
    );
  }
}

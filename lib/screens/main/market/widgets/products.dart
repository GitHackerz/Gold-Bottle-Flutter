import 'package:bouteille_dor/screens/main/market/widgets/products_list.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int currentTab;

  final _unselectedColor = const Color(0xff5f6368);
  final _tabs = [
    const Tab(text: 'Electronics'),
    const Tab(text: 'Clothing'),
    const Tab(text: 'Home'),
  ];

  final Map<String, List<Map<String, String>>> _productsByCategory = {
    'Electronics': [
      {
        'name': 'Smartphone',
        'price': '699',
        'image': 'assets/images/products/product.png'
      },
      {
        'name': 'Laptop',
        'price': '1299',
        'image': 'assets/images/products/product.png'
      },
      {
        'name': 'Headphones',
        'price': '199',
        'image': 'assets/images/products/product.png'
      },
    ],
    'Clothing': [
      {
        'name': 'T-Shirt',
        'price': '25 Coins',
        'image': 'assets/images/products/product.png'
      },
      {
        'name': 'Jeans',
        'price': '50 Coints',
        'image': 'assets/images/products/product.png'
      },
      {
        'name': 'Jacket',
        'price': '120 Coints',
        'image': 'assets/images/products/product.png'
      },
    ],
    'Home': [
      {
        'name': 'Sofa',
        'price': '450 Coints',
        'image': 'assets/images/products/product.png'
      },
      {
        'name': 'Table',
        'price': '200 Coints',
        'image': 'assets/images/products/product.png'
      },
      {
        'name': 'Lamp',
        'price': '30 Coints',
        'image': 'assets/images/products/product.png'
      },
    ],
  };

  @override
  void initState() {
    currentTab = 1;

    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.animation!.addListener(() {
      final value = _tabController.animation!.value.round();
      if (value != currentTab && mounted) {
        changePage(value);
      }
    });
    super.initState();
  }

  void changePage(int newTab) {
    setState(() {
      currentTab = newTab;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: _tabs,
          labelColor: Theme.of(context).colorScheme.primary,
          indicatorColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: _unselectedColor,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        Expanded(
          // Use Expanded to take up remaining space
          child: TabBarView(
            controller: _tabController,
            children: _productsByCategory.keys.map((category) {
              return ProductList(products: _productsByCategory[category]!);
            }).toList(),
          ),
        ),
      ],
    );
  }
}

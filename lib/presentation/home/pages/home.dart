import 'package:ecommerce_mobile_app/common/widgets/appbar/home_appbar.dart';
import 'package:ecommerce_mobile_app/presentation/home/widgets/product_container.dart';
import 'package:ecommerce_mobile_app/core/configs/assets/app_images.dart';
import 'package:ecommerce_mobile_app/presentation/home/pages/sort_of_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/search/custom_search_delegate.dart';

class HomePage extends StatelessWidget{
  final SearchController searchController = SearchController();
  final List<String> items = ['Apple', 'Banana', 'Mango', 'Orange', 'Grapes'];

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _searchBar(context)),

          SliverToBoxAdapter(child: _buildSectionTitle('Categories', context)),
          SliverToBoxAdapter(child: _buildCategories()),

          SliverToBoxAdapter(child: _buildSectionTitle('Top Selling', context)),
          SliverToBoxAdapter(child: _buildProductList()),

          SliverToBoxAdapter(child: _buildSectionTitle('Recently Viewed', context)),
          SliverToBoxAdapter(child: _buildProductList()),
        ],
      ),
    );
  }

  Widget _searchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: InkWell(
        onTap: () async {
          final result = await showSearch(
            context: context,
            delegate: CustomSearchDelegate(items: items),
          );

          // Xử lý kết quả tìm kiếm nếu cần
          print("Người dùng chọn: $result");
        },
        child: IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Màu bóng
                  spreadRadius: 1, // Độ lan của bóng
                  blurRadius: 16, // Độ mờ
                  offset: const Offset(0, 8), // Vị trí bóng
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Color(0xffF4F4F4),
                filled: true,
                hintText: 'Search.',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:20, bottom:10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: (){
              if(title == 'Categories'){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => Categories())
                );
              }
            },
            child: Text('See All',
                style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategories(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xffF4F4F4),
              shape: BoxShape.circle,
            ),
            child: Image.asset(AppImages.hoody),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xffF4F4F4),
              shape: BoxShape.circle,
            ),
            child: Image.asset(AppImages.hoody),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xffF4F4F4),
              shape: BoxShape.circle,
            ),
            child: Image.asset(AppImages.hoody),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xffF4F4F4),
              shape: BoxShape.circle,
            ),
            child: Image.asset(AppImages.hoody),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xffF4F4F4),
              shape: BoxShape.circle,
            ),
            child: Image.asset(AppImages.hoody),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(){
    final products = [
      {
        'name': "Men's Harrington Jacket",
        'price': "\$148.00",
      },
      {
        'name': "Max Cirro Men's Slides",
        'price': "\$55.00",
      },
      {
        'name': "Max Cirro Men's Slides",
        'price': "\$55.00",
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 220,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, item){
            final product = products[item];
            return ProductContainer(
                imageProduct: AppImages.product,
                nameProduct: product['name'].toString(),
                priceProduct: product['price'].toString(),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 16),
          itemCount: products.length
        ),
      ),
    );
  }

}

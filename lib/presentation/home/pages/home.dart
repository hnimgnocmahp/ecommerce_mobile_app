import 'package:ecommerce_mobile_app/common/widgets/appbar/home_appbar.dart';
import 'package:ecommerce_mobile_app/core/configs/assets/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/search/CustomSearchDelegate.dart';

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

          SliverToBoxAdapter(child: _buildSectionTitle('Categories')),
           SliverToBoxAdapter(child: _buildCategories()),

          SliverToBoxAdapter(child: _buildSectionTitle('Top Selling')),
          SliverToBoxAdapter(child: _buildProductList()),

          SliverToBoxAdapter(child: _buildSectionTitle('Recently Viewed')),
          SliverToBoxAdapter(child: _buildProductList()),
        ],
      ),

      // bottomNavigationBar: ,
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
          child: TextField(
            decoration: InputDecoration(
              fillColor: Color(0xffF4F4F4),
              filled: true,
              hintText: 'Search.',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top:20, bottom:10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('See All',
              style: TextStyle(fontSize: 16),)
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
            return Container(
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(AppImages.product, fit: BoxFit.cover,)
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          product['name']!,
                          style: const TextStyle(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          product['price']!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.favorite_border_rounded)
                    ),
                  ),
              ]
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 16),
          itemCount: products.length
        ),
      ),
    );
  }

}
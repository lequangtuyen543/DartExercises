import 'package:flutter/material.dart';

class Exercise4Screen extends StatefulWidget {
  const Exercise4Screen({super.key});

  @override
  State<Exercise4Screen> createState() => _Exercise4ScreenState();
}

class _Exercise4ScreenState extends State<Exercise4Screen> {
  int _selectedLayout = 0; // 0 = Layout 1, 1 = Layout 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedLayout == 0 ? const Layout1Screen() : const Layout2Screen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedLayout,
        onTap: (index) {
          setState(() {
            _selectedLayout = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Layout 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Layout 2',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// LAYOUT 1: Saved Places (Grid Layout)
// ==========================================
class Layout1Screen extends StatelessWidget {
  const Layout1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.star_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome,',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),
            const Text(
              'Charlie',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Saved Places',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Grid 2x2
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildPlaceCard(
                  'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?w=400',
                ),
                _buildPlaceCard(
                  'https://images.unsplash.com/photo-1586348943529-beaae6c28db9?w=400',
                ),
                _buildPlaceCard(
                  'https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?w=400',
                ),
                _buildPlaceCard(
                  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceCard(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ==========================================
// LAYOUT 2: Hotel Booking List
// ==========================================
class Layout2Screen extends StatelessWidget {
  const Layout2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Xung quanh vị trí hiện tại',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 2),
            Text(
              '23 thg 10 - 24 thg 10',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.favorite, color: Colors.white, size: 20),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildFilterButton('Sắp xếp', Icons.sort),
                const SizedBox(width: 12),
                _buildFilterButton('Lọc', Icons.filter_list),
                const SizedBox(width: 12),
                _buildFilterButton('Bản đồ', Icons.map_outlined),
              ],
            ),
          ),
          // Results count
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: const Text(
              '757 chỗ nghỉ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          // Hotel list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildHotelCard(
                  imageUrl: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400',
                  label: 'Bao bữa sáng',
                  name: 'aNhill Boutique',
                  rating: 9.5,
                  ratingText: 'Xuất sắc',
                  reviews: '95 đánh giá',
                  location: 'Huế · Cách bạn 0,6km',
                  roomType: '1 suite riêng tư: 1 giường',
                  price: 'US\$109',
                  priceNote: 'Đã bao gồm thuế và phí',
                ),
                _buildHotelCard(
                  imageUrl: 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=400',
                  label: 'Bao bữa sáng',
                  name: 'An Nam Hue Boutique',
                  rating: 9.2,
                  ratingText: 'Tuyệt hảo',
                  reviews: '34 đánh giá',
                  location: 'Cư Chánh · Cách bạn 0,9km',
                  roomType: '1 phòng khách sạn: 1 giường',
                  price: 'US\$20',
                  priceNote: 'Đã bao gồm thuế và phí',
                ),
                _buildHotelCard(
                  imageUrl: 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400',
                  label: 'Bao bữa sáng',
                  name: 'Huế Jade Hill Villa',
                  rating: 8.0,
                  ratingText: 'Rất tốt',
                  reviews: '1 đánh giá',
                  location: 'Cư Chánh · Cách bạn 1,3km',
                  roomType: '1 biệt thự nguyên căn - 1.000 m²',
                  price: 'US\$285',
                  priceNote: 'Đã bao gồm thuế và phí',
                  extraNote: 'Chỉ còn 1 căn với giá này trên\nBooking.com',
                  availabilityNote: 'Không cần thanh toán trước',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildHotelCard({
    required String imageUrl,
    required String label,
    required String name,
    required double rating,
    required String ratingText,
    required String reviews,
    required String location,
    required String roomType,
    required String price,
    required String priceNote,
    String? extraNote,
    String? availabilityNote,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with label
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(Icons.favorite_border),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    ...List.generate(5, (index) => const Icon(Icons.star, color: Colors.amber, size: 16)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      ratingText,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '· $reviews',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(location, style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  roomType,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                if (extraNote != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    extraNote,
                    style: TextStyle(color: Colors.red[700], fontSize: 12),
                  ),
                ],
                if (availabilityNote != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.check, size: 16, color: Colors.green[700]),
                      const SizedBox(width: 4),
                      Text(
                        availabilityNote,
                        style: TextStyle(color: Colors.green[700], fontSize: 12),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          priceNote,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
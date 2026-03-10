import 'package:flutter/material.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _buildMarketplaceScrollableContent(),
      ),
    );
  }

  Widget _buildMarketplaceScrollableContent() {
    return CustomScrollView(
      // Bouncing physics for that premium iOS feel
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        _buildHeader(),
        _buildActionButtons(),
        _buildSectionHeader(),
        _buildProductGrid(),
      ],
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Marketplace',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                _buildCircleIconButton(Icons.person),
                const SizedBox(width: 8),
                _buildCircleIconButton(Icons.search),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 24, color: Colors.black),
    );
  }

  Widget _buildActionButtons() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(child: _buildActionButton(Icons.edit, 'Bán')),
            const SizedBox(width: 12),
            Expanded(child: _buildActionButton(Icons.list, 'Hạng mục')),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.black),
          const SizedBox(width: 8),
          Text(label,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(top: BorderSide(color: Colors.grey.shade300, width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Lựa chọn hôm nay',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: const [
                Icon(Icons.location_on, size: 18, color: Color(0xFF1877F2)),
                SizedBox(width: 4),
                Text(
                  'Xom Yen Loc',
                  style: TextStyle(
                      color: Color(0xFF1877F2), fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    final List<MarketplaceItem> items = [
      MarketplaceItem(
        title: 'Smartphone Pro Max',
        price: '18.500.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Luxury SUV Car',
        price: '1.200.000.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Gaming Laptop RTX',
        price: '35.000.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Professional Audio Mixer',
        price: '8.400.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1598488035139-bdbb2231ce04?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Honda Winner X',
        price: '38.000.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1558981403-c5f91eb9c08d?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Modern Coffee Table',
        price: '2.500.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1530018607912-eff2df114f11?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Wireless Headphones',
        price: '4.200.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Smart Watch Series 9',
        price: '10.500.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1544117518-30df578096a4?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Sneaker Running Style',
        price: '1.800.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'DSRL Camera Kit',
        price: '22.000.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Classic Guitar',
        price: '3.600.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1525201548942-d8732f6617a0?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Mechanical Keyboard',
        price: '2.100.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1511467687858-23d96c32e4ae?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Electric Vespa',
        price: '65.000.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1571151607517-b3c9d8191999?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Smart TV 4K 55"',
        price: '14.500.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Backpack Waterproof',
        price: '750.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1553062407-98eeb94c6a62?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Mountain Bike',
        price: '12.800.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1485965120184-e220f721d03e?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Office Chair Ergonomic',
        price: '4.500.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1580480055273-228ff538c372?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Coffee Machine Luxe',
        price: '6.200.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1517668808822-9ebb02f2a0e6?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Wall Art Painting',
        price: '1.200.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?auto=format&fit=crop&q=80&w=800',
      ),
      MarketplaceItem(
        title: 'Plants Indoor Set',
        price: '850.000 đ',
        imageUrl:
            'https://images.unsplash.com/photo-1485955900006-10f4d324d411?auto=format&fit=crop&q=80&w=800',
      ),
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 0.8,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildProductCard(items[index]),
          childCount: items.length,
        ),
      ),
    );
  }

  Widget _buildProductCard(MarketplaceItem item) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                item.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(
                      color: Colors.grey.shade100,
                      child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2)));
                },
                errorBuilder: (context, _, __) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.broken_image, color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${item.price} · ${item.title}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MarketplaceItem {
  final String title;
  final String price;
  final String imageUrl;

  MarketplaceItem({
    required this.title,
    required this.price,
    required this.imageUrl,
  });
}

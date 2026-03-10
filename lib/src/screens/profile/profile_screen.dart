import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final String myProfileUrl =
      'https://images.unsplash.com/photo-1517841905240-472988babdf9?v=1&q=80&w=400&auto=format&fit=crop';
  final String coverImageUrl =
      'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?q=80&w=800&auto=format&fit=crop';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1877F2)),
        useMaterial3: true,
      ),
      child: Material(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildCustomHeader(context),
                _buildCoverAndAvatarSection(),
                _buildIdentitySection(),
                _buildActionButtons(),
                const Divider(thickness: 1, color: Color(0xFFE5E5E5)),
                _buildWeeklyProgressCard(),
                _buildProfileDetails(),
                _buildStoryHighlights(),
                const Divider(thickness: 8, color: Color(0xFFF0F2F5)),
                _buildPostComposer(),
                const Divider(thickness: 8, color: Color(0xFFF0F2F5)),
                _buildFeedSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              // Dùng Navigator từ context của CupertinoTabView
              Navigator.of(context, rootNavigator: false).pop();
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCoverAndAvatarSection() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // Cover Image
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            image: DecorationImage(
              image: NetworkImage(coverImageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 12,
                right: 12,
                child: _buildCircleActionIcon(Icons.camera_alt),
              ),
              const Center(
                child: Text(
                  "Thêm ảnh bìa",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Avatar Image
        Positioned(
          bottom: -70,
          left: 16,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(myProfileUrl),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: _buildCircleActionIcon(Icons.camera_alt, size: 20),
              ),
              // What's on your mind bubble
              Positioned(
                top: -20,
                left: -20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  child: const Text(
                    "Bạn đang nghĩ gì?",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCircleActionIcon(IconData icon, {double size = 24}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black87, size: size),
    );
  }

  Widget _buildIdentitySection() {
    return Container(
      padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Thanh Huyền",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down, color: Colors.black87),
            ],
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black87, fontSize: 16),
              children: [
                const TextSpan(
                    text: "1,8K",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: " người theo dõi  •  "),
                const TextSpan(
                    text: "41", style: TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: " đang theo dõi"),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "\"Redamancy\"",
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.bar_chart, color: Colors.white, size: 20),
              label: const Text("Công cụ chuyển..."),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1877F2),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 5,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.black87, size: 20),
              label: const Text("Thêm vào tin"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black87,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.more_horiz, color: Colors.black87),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyProgressCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tiến độ hàng tuần",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 20, color: Colors.black54),
                onPressed: () {},
              ),
            ],
          ),
          const Text(
            "Hãy hoàn thành các bước trong tuần này để đạt được mục tiêu.",
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
          const SizedBox(height: 16),
          _buildProgressItem(
            icon: Icons.people_outline,
            title: "Thu hút 5 người theo dõi mới",
            subtitle: "0/5 người theo dõi",
          ),
          const Divider(height: 32),
          _buildProgressItem(
            icon: Icons.movie_creation_outlined,
            title: "Tạo 6 thước phim công khai mới",
            subtitle: "Đã hoàn tất 0/6",
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black87,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Xem tất cả"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Icon(icon, size: 28, color: Colors.black87),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, color: Colors.black54),
      ],
    );
  }

  Widget _buildProfileDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.web_outlined, color: Colors.blue[700]),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                    children: [
                      const TextSpan(
                          text: "Trang cá nhân",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: " • Người sáng tạo nội dung số"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Icon(Icons.more_horiz, color: Colors.black54),
              SizedBox(width: 12),
              Text(
                "Xem thông tin giới thiệu của bạn",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStoryHighlights() {
    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildAddHighlight(),
          _buildHighlightItem("💙",
              "https://images.unsplash.com/photo-1507525428034-b723cf961d3e"),
          _buildHighlightItem("ĐN🌻",
              "https://images.unsplash.com/photo-1519046904884-53103b34b206"),
          _buildHighlightItem("😜",
              "https://images.unsplash.com/photo-1471922694854-ff1b63b20054"),
        ],
      ),
    );
  }

  Widget _buildAddHighlight() {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add, size: 40, color: Colors.black87),
          const SizedBox(height: 8),
          const Text("Mới", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildHighlightItem(String label, String imageUrl) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostComposer() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Bài viết",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Bộ lọc",
                style: TextStyle(color: Colors.blue[700], fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(myProfileUrl),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  "Bạn đang nghĩ gì?",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
              const Icon(Icons.photo_library, color: Colors.green),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildPostAction(
                    Icons.movie_creation, "Thước phim", Colors.red),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildPostAction(
                    Icons.videocam, "Phát trực tiếp", Colors.orange),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.article_outlined, color: Colors.black87),
              label: const Text("Quản lý bài viết"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black87,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostAction(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildFeedSection() {
    return Column(
      children: [
        _buildPostItem(
          "Thanh Huyền cùng với Linh Nhi và 3 người khác.",
          "12 Th2 • 🌎",
          "Gói ghém một chút dịu dàng, gửi vào tà áo đó rạng rỡ hôm nay ✨✨",
          [
            "https://images.unsplash.com/photo-1520699917327-af6bd9ec1f15",
            "https://images.unsplash.com/photo-1524255684952-d7185b509571",
            "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
            "https://images.unsplash.com/photo-1517841905240-472988babdf9",
          ],
        ),
      ],
    );
  }

  Widget _buildPostItem(
      String title, String subtitle, String content, List<String> images) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(myProfileUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      subtitle,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
          const SizedBox(height: 12),
          Text(content, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 12),
          // Image Grid
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Row(
              children: [
                Expanded(
                  child:
                      Image.network(images[0], height: 300, fit: BoxFit.cover),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(images[1],
                          height: 148,
                          width: double.infinity,
                          fit: BoxFit.cover),
                      const SizedBox(height: 4),
                      Image.network(images[2],
                          height: 148,
                          width: double.infinity,
                          fit: BoxFit.cover),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child:
                    const Icon(Icons.thumb_up, size: 10, color: Colors.white),
              ),
              const SizedBox(width: 4),
              const Text("Bạn, Xuân Roxi và 70",
                  style: TextStyle(color: Colors.black54)),
              const Spacer(),
              const Text("27 bình luận",
                  style: TextStyle(color: Colors.black54)),
            ],
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInteraction(
                  Icons.favorite_outline, "Yêu thích", Colors.red),
              _buildInteraction(
                  Icons.chat_bubble_outline, "Bình luận", Colors.grey),
              _buildInteraction(Icons.redo_outlined, "Chia sẻ", Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInteraction(IconData icon, String label, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

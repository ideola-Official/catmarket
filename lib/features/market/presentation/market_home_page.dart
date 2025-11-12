import 'package:flutter/material.dart';

import 'screens/create_group_purchase_screen.dart';
import 'screens/create_listing_screen.dart';

class MarketHomePage extends StatefulWidget {
  const MarketHomePage({super.key});

  @override
  State<MarketHomePage> createState() => _MarketHomePageState();
}

class _MarketHomePageState extends State<MarketHomePage>
    with SingleTickerProviderStateMixin {
  final List<_MarketCategory> _categories = const [
    _MarketCategory(label: '전체', icon: Icons.apps),
    _MarketCategory(label: '리셀', icon: Icons.repeat),
    _MarketCategory(label: '공동구매', icon: Icons.groups_2),
    _MarketCategory(label: '생활', icon: Icons.chair_alt),
    _MarketCategory(label: '디지털', icon: Icons.devices_other),
    _MarketCategory(label: '패션', icon: Icons.checkroom),
    _MarketCategory(label: '교재', icon: Icons.menu_book),
  ];

  final List<_ResaleItem> _resaleItems = const [
    _ResaleItem(
      title: '맥북 에어 M2 13인치',
      price: '1,100,000원',
      meta: '한남대 본캠퍼스 · 1시간 전',
      chats: 3,
      likes: 8,
      thumbnailColor: Color(0xFFFFB74D),
    ),
    _ResaleItem(
      title: '아이패드 프로 11 + 매직키보드',
      price: '950,000원',
      meta: '한남대 기숙사 · 2시간 전',
      chats: 5,
      likes: 12,
      thumbnailColor: Color(0xFF81D4FA),
    ),
    _ResaleItem(
      title: '한남대 경영학과 전공책 묶음 판매',
      price: '40,000원',
      meta: '한남대 본캠퍼스 · 3시간 전',
      chats: 1,
      likes: 4,
      thumbnailColor: Color(0xFFB39DDB),
    ),
    _ResaleItem(
      title: '캠핑 의자 2개 세트',
      price: '25,000원',
      meta: '한남대 도서관 앞 · 6시간 전',
      chats: 2,
      likes: 7,
      thumbnailColor: Color(0xFFAED581),
    ),
  ];

  final List<_GroupPurchaseItem> _groupPurchases = const [
    _GroupPurchaseItem(
      title: '맥도날드 치킨버거 세트 공동구매',
      meta: '목표 5명 · 현재 3명 참여',
      progress: 0.6,
      due: '오늘 마감',
      thumbnailColor: Color(0xFFE57373),
    ),
    _GroupPurchaseItem(
      title: '아이패드 종이질감 필름 10장',
      meta: '목표 8명 · 현재 2명 참여',
      progress: 0.25,
      due: 'D-2',
      thumbnailColor: Color(0xFF64B5F6),
    ),
    _GroupPurchaseItem(
      title: '토익 단체 응시권 할인',
      meta: '목표 10명 · 현재 7명 참여',
      progress: 0.7,
      due: 'D-5',
      thumbnailColor: Color(0xFF4DB6AC),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(124),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0.5,
            flexibleSpace: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                '한남대 본캠퍼스',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 22,
                                color: Colors.grey.shade700,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search, color: Colors.grey.shade800),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.tune, color: Colors.grey.shade800),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon:
                              Icon(Icons.notifications_none, color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 72,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = _categories[index];
                        return _CategoryIconChip(category: category);
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemCount: _categories.length,
                    ),
                  ),
                  const Divider(height: 1),
                  const TabBar(
                    indicatorColor: Color(0xFFFF6F0F),
                    labelColor: Color(0xFFFF6F0F),
                    unselectedLabelColor: Colors.black54,
                    tabs: [
                      Tab(text: '리셀'),
                      Tab(text: '공동구매'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildResaleList(colorScheme),
            _buildGroupPurchaseList(colorScheme),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showCreateOptions(context),
          icon: const Icon(Icons.edit),
          label: const Text('글쓰기'),
        ),
      ),
    );
  }

  Widget _buildResaleList(ColorScheme colorScheme) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemBuilder: (context, index) {
        final item = _resaleItems[index];
        return _ResaleCard(item: item);
      },
      separatorBuilder: (_, __) => const Divider(height: 24),
      itemCount: _resaleItems.length,
    );
  }

  Widget _buildGroupPurchaseList(ColorScheme colorScheme) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemBuilder: (context, index) {
        final item = _groupPurchases[index];
        return _GroupPurchaseCard(item: item);
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: _groupPurchases.length,
    );
  }

  void _showCreateOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFFFE0B2),
                    child: Icon(Icons.camera_alt, color: Color(0xFFFF6F0F)),
                  ),
                  title: const Text('리셀 상품 등록'),
                  subtitle: const Text('중고 물품을 등록하고 거래를 시작하세요.'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CreateListingScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFE1F5FE),
                    child: Icon(Icons.groups, color: Color(0xFF0288D1)),
                  ),
                  title: const Text('공동구매 모집'),
                  subtitle: const Text('참여자를 모집하고 목표를 설정하세요.'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CreateGroupPurchaseScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CategoryIconChip extends StatelessWidget {
  const _CategoryIconChip({required this.category});

  final _MarketCategory category;

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = category.label == '전체';
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isPrimary ? const Color(0xFFFFF3E0) : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            category.icon,
            color: isPrimary ? const Color(0xFFFF6F0F) : Colors.grey.shade700,
            size: 28,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          category.label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isPrimary ? const Color(0xFFFF6F0F) : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}

class _ResaleCard extends StatelessWidget {
  const _ResaleCard({required this.item});

  final _ResaleItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 100,
            height: 100,
            color: item.thumbnailColor,
            child: const Icon(
              Icons.image_outlined,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.meta,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.chat_bubble_outline, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 4),
                  Text('${item.chats}', style: TextStyle(color: Colors.grey.shade600)),
                  const SizedBox(width: 12),
                  Icon(Icons.favorite_border, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 4),
                  Text('${item.likes}', style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GroupPurchaseCard extends StatelessWidget {
  const _GroupPurchaseCard({required this.item});

  final _GroupPurchaseItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 90,
              height: 90,
              color: item.thumbnailColor,
              child: const Icon(Icons.groups, color: Colors.white, size: 36),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.meta,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: item.progress,
                    backgroundColor: Colors.grey.shade200,
                    color: const Color(0xFFFF6F0F),
                    minHeight: 6,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  item.due,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MarketCategory {
  const _MarketCategory({required this.label, required this.icon});

  final String label;
  final IconData icon;
}

class _ResaleItem {
  const _ResaleItem({
    required this.title,
    required this.price,
    required this.meta,
    required this.chats,
    required this.likes,
    required this.thumbnailColor,
  });

  final String title;
  final String price;
  final String meta;
  final int chats;
  final int likes;
  final Color thumbnailColor;
}

class _GroupPurchaseItem {
  const _GroupPurchaseItem({
    required this.title,
    required this.meta,
    required this.progress,
    required this.due,
    required this.thumbnailColor,
  });

  final String title;
  final String meta;
  final double progress;
  final String due;
  final Color thumbnailColor;
}


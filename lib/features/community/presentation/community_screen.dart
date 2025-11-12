import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  static const _posts = [
    _CommunityPost(
      category: '자유게시판',
      title: '한남대 근처 스터디 카페 추천해주세요!',
      excerpt: '중간고사 대비하려고 하는데, 조용하고 콘센트 많은 곳 찾고 있어요.',
      author: '경제학과 18학번',
      timeAgo: '2시간 전',
      likes: 24,
      comments: 5,
    ),
    _CommunityPost(
      category: '정보공유',
      title: '캠퍼스 소모임 총정리 (2025년 2학기 업데이트)',
      excerpt: '전공별 소모임부터 취업 준비 스터디까지 한 번에 모아봤어요.',
      author: '경영학과 20학번',
      timeAgo: '4시간 전',
      likes: 46,
      comments: 12,
    ),
    _CommunityPost(
      category: '질문있어요',
      title: '교양 <미디어와 사회> 강의 들어보신 분 계신가요?',
      excerpt: '수업 방식, 과제 난이도, 시험 범위 등 궁금합니다.',
      author: '디자인학과 21학번',
      timeAgo: '6시간 전',
      likes: 18,
      comments: 7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '캠퍼스 커뮤니티',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          bottom: const TabBar(
            labelColor: Color(0xFFFF6F0F),
            unselectedLabelColor: Colors.black54,
            indicatorColor: Color(0xFFFF6F0F),
            tabs: [
              Tab(text: '인기'),
              Tab(text: '최신'),
              Tab(text: '질문'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openCreatePost(context),
          child: const Icon(Icons.edit),
        ),
        body: TabBarView(
          children: [
            _buildPostList(),
            _buildPostList(),
            _buildPostList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPostList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemBuilder: (context, index) {
        final post = _posts[index];
        return _PostTile(post: post);
      },
      separatorBuilder: (_, __) => const Divider(height: 24),
      itemCount: _posts.length,
    );
  }

  void _openCreatePost(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return const _PostComposerSheet();
      },
    );
  }
}

class _PostTile extends StatelessWidget {
  const _PostTile({required this.post});

  final _CommunityPost post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            post.category,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          post.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          post.excerpt,
          style: TextStyle(
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              '${post.author} · ${post.timeAgo}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Icon(Icons.thumb_up_alt_outlined,
                    size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text('${post.likes}',
                    style: TextStyle(color: Colors.grey.shade600)),
                const SizedBox(width: 12),
                Icon(Icons.chat_bubble_outline,
                    size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text('${post.comments}',
                    style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _PostComposerSheet extends StatelessWidget {
  const _PostComposerSheet();

  @override
  Widget build(BuildContext context) {
    final categories = ['자유게시판', '정보공유', '질문있어요', '홍보/모집'];
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      minChildSize: 0.6,
      builder: (context, controller) {
        return SingleChildScrollView(
          controller: controller,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '게시글 작성',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: categories
                      .map(
                        (category) => ChoiceChip(
                          label: Text(category),
                          selected: category == '자유게시판',
                          onSelected: (_) {},
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    hintText: '제목을 입력하세요',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 18),
                  ),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Divider(),
                const SizedBox(height: 12),
                const TextField(
                  maxLines: 12,
                  decoration: InputDecoration(
                    hintText: '내용을 입력하세요.',
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.image_outlined),
                  label: const Text('사진 첨부'),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text(
                      '게시글 등록',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CommunityPost {
  const _CommunityPost({
    required this.category,
    required this.title,
    required this.excerpt,
    required this.author,
    required this.timeAgo,
    required this.likes,
    required this.comments,
  });

  final String category;
  final String title;
  final String excerpt;
  final String author;
  final String timeAgo;
  final int likes;
  final int comments;
}


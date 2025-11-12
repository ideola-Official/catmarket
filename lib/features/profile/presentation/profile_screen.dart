import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          '내 정보',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProfileHeader(onEdit: () {}),
            const SizedBox(height: 20),
            _SegmentCard(
              title: '나의 활동',
              children: const [
                _SegmentTile(
                  icon: Icons.shopping_basket_outlined,
                  title: '거래 내역',
                  subtitle: '리셀 & 공동구매 참여 내역 보기',
                ),
                _SegmentTile(
                  icon: Icons.assignment_turned_in_outlined,
                  title: '외주 참여 내역',
                  subtitle: '등록한 프로젝트와 작업자 히스토리',
                ),
                _SegmentTile(
                  icon: Icons.forum_outlined,
                  title: '커뮤니티 활동',
                  subtitle: '작성한 게시글과 댓글',
                ),
              ],
            ),
            const SizedBox(height: 20),
            _SegmentCard(
              title: '나의 정보',
              children: const [
                _SegmentTile(
                  icon: Icons.verified_user_outlined,
                  title: '학교 인증 현황',
                  subtitle: 'student@hannam.ac.kr',
                  trailing: Text(
                    '인증 완료',
                    style: TextStyle(
                      color: Color(0xFF2E7D32),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _SegmentTile(
                  icon: Icons.account_balance_wallet_outlined,
                  title: '정산 정보',
                  subtitle: '외주 정산 계좌 및 세금 신고 안내',
                ),
                _SegmentTile(
                  icon: Icons.notifications_outlined,
                  title: '알림 설정',
                  subtitle: '푸시 알림, 이메일 알림 관리',
                ),
              ],
            ),
            const SizedBox(height: 20),
            _SegmentCard(
              title: '고객 지원',
              children: const [
                _SegmentTile(
                  icon: Icons.help_outline,
                  title: '자주 묻는 질문',
                  subtitle: '거래 및 외주 진행 관련 FAQ',
                ),
                _SegmentTile(
                  icon: Icons.support_agent_outlined,
                  title: '1:1 문의',
                  subtitle: '운영팀과 채팅으로 문의하기',
                ),
                _SegmentTile(
                  icon: Icons.policy_outlined,
                  title: '약관 및 정책',
                  subtitle: '이용약관, 개인정보 처리방침',
                ),
              ],
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(Icons.logout),
              label: const Text(
                '로그아웃',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {},
              child: const Text(
                '탈퇴 신청',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.onEdit});

  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundColor: Color(0xFFFFF3E0),
            child: Icon(Icons.person, size: 36, color: Color(0xFFFF6F0F)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '홍지원',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '미디어커뮤니케이션학과 20학번',
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(height: 12),
                _BadgeRow(),
              ],
            ),
          ),
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
    );
  }
}

class _BadgeRow extends StatelessWidget {
  const _BadgeRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: const [
        _ProfileBadge(
          icon: Icons.verified,
          label: '학교 인증',
          color: Color(0xFF4CAF50),
        ),
        _ProfileBadge(
          icon: Icons.star_border,
          label: '외주 3회 완료',
          color: Color(0xFFFFC107),
        ),
        _ProfileBadge(
          icon: Icons.chat_bubble_outline,
          label: '커뮤니티 활동',
          color: Color(0xFF42A5F5),
        ),
      ],
    );
  }
}

class _ProfileBadge extends StatelessWidget {
  const _ProfileBadge({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SegmentCard extends StatelessWidget {
  const _SegmentCard({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _SegmentTile extends StatelessWidget {
  const _SegmentTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey.shade100,
            child: Icon(icon, color: Colors.grey.shade700),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          trailing: trailing ?? const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        const Divider(height: 1),
      ],
    );
  }
}


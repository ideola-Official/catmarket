import 'package:flutter/material.dart';

class RegisterFreelancerScreen extends StatelessWidget {
  const RegisterFreelancerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'UI/UX 디자인',
      '브랜딩',
      '소셜 마케팅',
      'Flutter 개발',
      '영상 편집',
      '카피라이팅',
      '번역',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('작업자 등록하기'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '저장',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle('프로필 이미지'),
            const SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(Icons.person, size: 42, color: Colors.grey),
                ),
                const SizedBox(width: 16),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: const Text('사진 변경'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const _SectionTitle('이름 / 닉네임'),
            const SizedBox(height: 8),
            const _OutlineTextField(hintText: '예) 디자이너 써니'),
            const SizedBox(height: 24),
            const _SectionTitle('전문 분야'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills
                  .map(
                    (skill) => FilterChip(
                      label: Text(skill),
                      onSelected: (_) {},
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            const _SectionTitle('보유 스킬'),
            const SizedBox(height: 8),
            const _OutlineTextField(
              hintText: '자격증, 사용 툴, 언어 등을 자유롭게 입력하세요',
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            const _SectionTitle('경력 소개'),
            const SizedBox(height: 8),
            const _OutlineTextField(
              hintText: '프로젝트 경험, 활동 이력 등을 자세히 작성해주세요',
              maxLines: 6,
            ),
            const SizedBox(height: 24),
            const _SectionTitle('포트폴리오 첨부'),
            const SizedBox(height: 8),
            _UploadBox(
              icon: Icons.picture_as_pdf_outlined,
              label: 'PDF, PPT, 이미지 등을 첨부하세요',
            ),
            const SizedBox(height: 16),
            _UploadBox(
              icon: Icons.link,
              label: 'Behance, Notion, GitHub 링크 등',
            ),
            const SizedBox(height: 24),
            const _SectionTitle('희망 단가 / 작업 유형'),
            const SizedBox(height: 8),
            Row(
              children: const [
                Expanded(
                  child: _OutlineTextField(
                    hintText: '시간당 단가',
                    keyboardType: TextInputType.number,
                    suffixText: '원',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _OutlineTextField(
                    hintText: '프로젝트 단가',
                    keyboardType: TextInputType.number,
                    suffixText: '원',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SwitchListTile(
              title: const Text('팀 프로젝트 가능'),
              subtitle: const Text('다른 작업자들과 협업이 가능한지 표시합니다.'),
              value: true,
              onChanged: (_) {},
            ),
            SwitchListTile(
              title: const Text('야간/주말 작업 가능'),
              subtitle: const Text('가능한 작업 시간을 의뢰자에게 알려주세요.'),
              value: false,
              onChanged: (_) {},
            ),
            const SizedBox(height: 24),
            const _NoticeCard(),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _OutlineTextField extends StatelessWidget {
  const _OutlineTextField({
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.suffixText,
  });

  final String hintText;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? suffixText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        suffixText: suffixText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF6F0F)),
        ),
      ),
    );
  }
}

class _UploadBox extends StatelessWidget {
  const _UploadBox({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 84,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.grey.shade600),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoticeCard extends StatelessWidget {
  const _NoticeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '등록 전 확인하세요',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '• 외부 포트폴리오 링크는 최신 내용으로 유지해주세요.\n'
            '• 연락 가능한 시간대를 상세히 작성하면 매칭률이 높아집니다.\n'
            '• 자동 계약/정산 기능은 제공되지 않으니 개별적으로 진행해주세요.',
            style: TextStyle(color: Colors.black87, fontSize: 13),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = const [
      '디자인',
      '마케팅',
      'IT·프로그래밍',
      '영상·사진·음향',
      '문서·글쓰기',
      '번역·통역',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('외주 등록하기'),
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
            const _SectionLabel('프로젝트 카테고리'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: categories
                  .map(
                    (category) => FilterChip(
                      label: Text(category),
                      onSelected: (_) {},
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            const _SectionLabel('프로젝트 제목'),
            const SizedBox(height: 8),
            const _OutlineField(hintText: '예) 동아리 로고 리디자인 의뢰'),
            const SizedBox(height: 24),
            const _SectionLabel('세부 요구사항'),
            const SizedBox(height: 8),
            const _OutlineField(
              hintText: '필수 기능, 레퍼런스, 참고 자료 등을 상세히 작성하세요.',
              maxLines: 6,
            ),
            const SizedBox(height: 24),
            const _SectionLabel('예산 범위'),
            const SizedBox(height: 8),
            Row(
              children: const [
                Expanded(
                  child: _OutlineField(
                    hintText: '최소 금액',
                    keyboardType: TextInputType.number,
                    suffixText: '원',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _OutlineField(
                    hintText: '최대 금액',
                    keyboardType: TextInputType.number,
                    suffixText: '원',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const _SectionLabel('희망 마감일'),
            const SizedBox(height: 8),
            const _OutlineField(
              hintText: 'YYYY.MM.DD',
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 24),
            const _SectionLabel('참고 파일 / 링크'),
            const SizedBox(height: 8),
            _UploadField(
              onTap: () {},
              placeholder: '참고자료를 첨부하거나 링크를 입력하세요',
            ),
            const SizedBox(height: 24),
            const _SectionLabel('진행 방식'),
            const SizedBox(height: 8),
            Column(
              children: [
                RadioListTile<int>(
                  value: 0,
                  groupValue: 0,
                  onChanged: (_) {},
                  title: const Text('온라인 협업'),
                  subtitle: const Text('캠퍼스 내외에서 온라인으로만 진행'),
                ),
                RadioListTile<int>(
                  value: 1,
                  groupValue: 0,
                  onChanged: (_) {},
                  title: const Text('대면 미팅 포함'),
                  subtitle: const Text('필요 시 캠퍼스 내에서 미팅 진행'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const _GuidelineCard(
              title: '외주 등록 체크리스트',
              items: [
                '요구사항과 산출물을 명확하게 작성했나요?',
                '예산과 마감일을 현실적으로 설정했나요?',
                '참고 자료와 레퍼런스를 충분히 첨부했나요?',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

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

class _OutlineField extends StatelessWidget {
  const _OutlineField({
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

class _UploadField extends StatelessWidget {
  const _UploadField({required this.onTap, required this.placeholder});

  final VoidCallback onTap;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.cloud_upload_outlined,
                  size: 30, color: Colors.grey),
              const SizedBox(height: 8),
              Text(
                placeholder,
                style: const TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuidelineCard extends StatelessWidget {
  const _GuidelineCard({
    required this.title,
    required this.items,
  });

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.lightbulb_outline, color: Color(0xFFFF6F0F)),
              SizedBox(width: 8),
              Text(
                '외주 등록 체크리스트',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ',
                      style:
                          TextStyle(fontSize: 14, color: Colors.black87)),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class CreateListingScreen extends StatelessWidget {
  const CreateListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['리셀', '공동구매', '생활', '디지털', '패션', '교재'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('리셀 상품 등록'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '등록',
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
            _SectionLabel('대표 이미지'),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.camera_alt_outlined, size: 32, color: Colors.grey),
                    SizedBox(height: 8),
                    Text('이미지 추가', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _SectionLabel('카테고리'),
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
            _SectionLabel('제목'),
            const _OutlinedTextField(hintText: '상품명을 입력하세요'),
            const SizedBox(height: 24),
            _SectionLabel('가격'),
            const _OutlinedTextField(
              hintText: '가격을 입력하세요',
              keyboardType: TextInputType.number,
              suffixText: '원',
            ),
            const SizedBox(height: 24),
            _SectionLabel('거래 희망 장소'),
            const _OutlinedTextField(
              hintText: '예) 한남대 본캠퍼스 도서관 앞',
            ),
            const SizedBox(height: 24),
            _SectionLabel('상품 설명'),
            const _OutlinedTextField(
              hintText: '상품의 상태와 특이사항을 입력하세요',
              maxLines: 6,
            ),
            const SizedBox(height: 24),
            SwitchListTile(
              value: true,
              onChanged: (_) {},
              title: const Text('가격 제안 받기'),
              subtitle: const Text('구매자와 가격 협상 기능을 활성화합니다.'),
            ),
            SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: const Text('공동구매로 모집하기'),
              subtitle: const Text('목표 인원을 설정하여 공동구매로 전환합니다.'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _OutlinedTextField extends StatelessWidget {
  const _OutlinedTextField({
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
      maxLines: maxLines,
      keyboardType: keyboardType,
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


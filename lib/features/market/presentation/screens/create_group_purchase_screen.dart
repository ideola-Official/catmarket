import 'package:flutter/material.dart';

class CreateGroupPurchaseScreen extends StatelessWidget {
  const CreateGroupPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공동구매 모집'),
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
          children: const [
            _SectionLabel('공동구매명'),
            SizedBox(height: 8),
            _OutlinedTextField(hintText: '모집할 상품 또는 서비스를 입력하세요'),
            SizedBox(height: 24),
            _SectionLabel('대표 이미지'),
            SizedBox(height: 8),
            _ImagePlaceholder(),
            SizedBox(height: 24),
            _SectionLabel('목표 참여자 수'),
            SizedBox(height: 8),
            _OutlinedTextField(
              hintText: '예) 10',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24),
            _SectionLabel('참여 1인당 금액'),
            SizedBox(height: 8),
            _OutlinedTextField(
              hintText: '예) 12,000원',
              keyboardType: TextInputType.number,
              suffixText: '원',
            ),
            SizedBox(height: 24),
            _SectionLabel('공동구매 마감일'),
            SizedBox(height: 8),
            _OutlinedTextField(
              hintText: 'YYYY.MM.DD',
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 24),
            _SectionLabel('수령 / 전달 방식'),
            SizedBox(height: 8),
            _OutlinedTextField(
              hintText: '직접 전달, 캠퍼스 픽업, 택배 등',
            ),
            SizedBox(height: 24),
            _SectionLabel('상세 설명'),
            SizedBox(height: 8),
            _OutlinedTextField(
              hintText: '참여 조건, 분배 방식 등 상세 내용을 입력하세요',
              maxLines: 6,
            ),
            SizedBox(height: 24),
            _GuidelineCard(),
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

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Icon(Icons.add_photo_alternate_outlined,
                size: 32, color: Colors.grey),
            SizedBox(height: 8),
            Text('이미지 추가', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _OutlinedTextField extends StatelessWidget {
  const _OutlinedTextField({
    required this.hintText,
    this.keyboardType,
    this.maxLines = 1,
    this.suffixText,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final int maxLines;
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

class _GuidelineCard extends StatelessWidget {
  const _GuidelineCard();

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
              Icon(Icons.info_outline, color: Color(0xFFFF6F0F)),
              SizedBox(width: 6),
              Text(
                '공동구매 가이드',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '• 목표 참여자 수를 달성하면, 참여자 명단을 공유해주세요.\n'
            '• 결제, 정산 등 자동화 기능은 제공되지 않으니 직접 진행해주세요.\n'
            '• 부정 거래 방지를 위해 학교 인증을 완료한 사용자만 모집 가능합니다.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}


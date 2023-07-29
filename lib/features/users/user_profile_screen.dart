import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          snap: true, // 최소한의 움직임만으로 floating 효과 적용 유무(floating: true 필수)
          floating: true, // 위치 상관 없이 상단 스크롤 시 appbar표시 유무
          pinned: false, // 최소높이 유지
          stretch: true, // 최상단 이상으로 스크롤 다운시 strecth 여부
          backgroundColor: Colors.teal,
          collapsedHeight: 120, // silver 동작 시작 높이(최소 높이)
          expandedHeight: 300, // 최대 높이
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true, // 타이틀 위치
            title: const Text("Title"), // 타이틀이 배경과 같이 움직임 (appbar에 포함되지 않음)
            stretchModes: const [
              // 최상단 이상으로 스크롤 다운시 stretch 효과 종류
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
            ],
            background: Image.asset(
              'assets/images/placeholder.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              color: Colors.amber[100 * (index % 9)],
              child: Align(
                alignment: Alignment.center,
                child: Text("Item $index"),
              ),
            ),
          ),
          itemExtent: 100,
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              color: Colors.blue[100 * (index % 9)],
              child: Align(
                alignment: Alignment.center,
                child: Text("Item $index"),
              ),
            ),
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            childAspectRatio: 1,
            crossAxisSpacing: Sizes.size20,
            mainAxisSpacing: Sizes.size20,
          ),
        )
      ],
    );
  }
}

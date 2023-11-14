import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/utils.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  final ScrollController _scrollController = ScrollController();
  bool _isWriting = false;
  // 엑스 버튼 클릭시
  void _onClosePressed() {
    // 위젯 버튼이 나왔지만 사실상 새로운 페이지 개념. 그래서 pop()
    Navigator.of(context).pop();
  }

  final Color _grey = Colors.grey.shade500;

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final isDark = isDarkMode(context);
    // 위젯 창 Container로 감싸서 보더링 추가하고 높이 조절 (상위 위젯에서 설정 필요)
    return Container(
      height: size.height * 0.75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size14,
        ),
      ),
      // 위젯 메인 영역. appBar를 쓰기위해 Scaffold를 사용
      child: Scaffold(
        backgroundColor: isDark ? null : Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: isDark ? null : Colors.grey.shade50,
          // 뒤로가기 버튼 유무
          automaticallyImplyLeading: false,
          title: const Text("22796 comments"),
          // actions에 아이콘을 넣으면 자동 우측 정렬되어 표시됨
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(
            // bottomNavigationBar: bottomAppBar 를 사용하면 키보드 출력시 사라지는 이슈가 발생함. 이를 방지하기 위해 Stack에 positioned로 추가.
            children: [
              Scrollbar(
                controller: _scrollController,
                // ListView.separated => list사이에 builder(간격 등)를 넣을 수 있음
                child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    left: Sizes.size16,
                    right: Sizes.size16,
                    bottom: Sizes.size96 + Sizes.size20,
                  ),
                  separatorBuilder: (context, index) => Gaps.v20,
                  itemCount: 10,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: isDark ? Colors.grey.shade500 : null,
                        child: const Text("태호"),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Taeho",
                              style: TextStyle(
                                color: _grey,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size14,
                              ),
                            ),
                            Gaps.v3,
                            const Text(
                                "im a comment im a comment im a comment im a comment im a comment im a commentim a comment im a comment im a comment"),
                          ],
                        ),
                      ),
                      Gaps.h8,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            color: _grey,
                            size: Sizes.size24,
                          ),
                          Gaps.v3,
                          Text(
                            "52.2K",
                            style: TextStyle(color: _grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: BottomAppBar(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                      vertical: Sizes.size10,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: _grey,
                        ),
                        Gaps.h10,
                        Expanded(
                          // TextField는 작은 사이즈의 padding이 불가하다 그래서 SizedBox를 포함시켜붜야 한다.
                          child: SizedBox(
                            height: Sizes.size44,
                            child: TextField(
                              onTap: _onStartWriting,
                              // 여러 줄로 expands 하기위해 maxLines, minLines를 모두 null로 만들어야 함.
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              // 키보드 설정 변경
                              textInputAction: TextInputAction.newline,
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                hintText: "Write a comment...",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size12,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: isDark
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade200,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size12,
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    right: Sizes.size14,
                                  ),
                                  child: Row(
                                    // 최소 공간만 차지하도록 설정(Row는 가로로 최대 길이를 차지함)
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.at,
                                        color: isDark
                                            ? Colors.grey.shade500
                                            : Colors.grey.shade900,
                                      ),
                                      Gaps.h14,
                                      FaIcon(
                                        FontAwesomeIcons.gift,
                                        color: isDark
                                            ? Colors.grey.shade500
                                            : Colors.grey.shade900,
                                      ),
                                      Gaps.h14,
                                      FaIcon(
                                        FontAwesomeIcons.faceSmile,
                                        color: isDark
                                            ? Colors.grey.shade500
                                            : Colors.grey.shade900,
                                      ),
                                      Gaps.h14,
                                      if (_isWriting)
                                        GestureDetector(
                                          onTap: _stopWriting,
                                          child: FaIcon(
                                            FontAwesomeIcons.circleArrowUp,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

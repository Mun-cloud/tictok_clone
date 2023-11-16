import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/breakpoints.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/utils.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: "Initial text");

  void _onSearchChanged(String value) {
    print("change : $value");
  }

  void _onSearchSubmitted(String value) {
    print("submit : $value");
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onTabTap(int value) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Breakpoint.sm,
            ),
            child: CupertinoSearchTextField(
              controller: _textEditingController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
              style: TextStyle(
                color: isDarkMode(context) ? Colors.white : Colors.black,
              ),
            ),
          ),
          elevation: 1,
          bottom: TabBar(
            onTap: _onTabTap,
            // 클릭시 적용되어있는 기본 효과 제거
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            // 스크롤 기능 추가
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              // 드래그 할 때 키보드 감추기
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(
                Sizes.size6,
              ),
              itemCount: 20,
              // 그리드 설정
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoint.lg ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => LayoutBuilder(
                builder: (context, constrains) => Column(
                  children: [
                    // border radius
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size4),
                      ),
                      // 비율 설정
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        // 로컬 이미지에서 동적 이미지 로딩 완료 후 변환(loader 설정)
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/placeholder.jpg",
                          image:
                              "https://source.unsplash.com/random/200x${355 + index}",
                        ),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      'This is very long cpation for my tiktok that im upload just now currently',
                      style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gaps.v8,
                    if (constrains.maxWidth < 200 || constrains.maxWidth > 250)
                      DefaultTextStyle(
                        style: TextStyle(
                            color: isDarkMode(context)
                                ? Colors.grey.shade300
                                : Colors.grey.shade600,
                            fontWeight: FontWeight.w600),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/85348363?v=4"),
                            ),
                            Gaps.h4,
                            const Expanded(
                              child: Text(
                                "My avatar is going to be very long",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size16,
                              color: Colors.grey.shade600,
                            ),
                            Gaps.h2,
                            const Text(
                              "2.5M",
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size28,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class HeaderSearchBar extends StatefulWidget {
  const HeaderSearchBar({
    super.key,
  });

  @override
  State<HeaderSearchBar> createState() => _HeaderSearchBarState();
}

class _HeaderSearchBarState extends State<HeaderSearchBar> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isWriting = false;
  void _onStartWriting() {
    setState(() {
      _isWriting = !_isWriting;
    });
  }

  void _deleteWriting() {
    setState(() {
      _textEditingController.clear();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.size44,
      child: TextField(
        controller: _textEditingController,
        onTap: _onStartWriting,
        // 키보드 설정 변경
        textInputAction: TextInputAction.newline,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Sizes.size12,
            ),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.grey.shade600,
              ),
            ],
          ),
          suffixIcon: Row(
            // 최소 공간만 차지하도록 설정(Row는 가로로 최대 길이를 차지함)
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_textEditingController.value.text.isNotEmpty)
                GestureDetector(
                  onTap: _deleteWriting,
                  child: FaIcon(
                    FontAwesomeIcons.solidCircleXmark,
                    color: Colors.grey.shade600,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

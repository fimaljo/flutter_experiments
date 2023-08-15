import 'package:flutter/material.dart';

import 'color_selection_icon.dart';

class WColorSelectionIcons extends StatefulWidget {
  const WColorSelectionIcons({ Key? key, required this.colors, required this.onTapDown }) : super(key: key);

  @override
  _WColorSelectionIconsState createState() => _WColorSelectionIconsState();


  final List<List<Color>> colors;
  final void Function(List<Color> color, TapDownDetails) onTapDown;
}

class _WColorSelectionIconsState extends State<WColorSelectionIcons> {
  @override
  void initState() {
    super.initState();

    _pageController.addListener(
      () => setState(() => _scrollAmount = _pageController.page!)
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.colors.length,
      itemBuilder: (context, index) => _buildPage(index, widget.colors[index])
    );
  }

  Widget _buildPage(int index, final List<Color> color) {    
    return Center(
      child: WColorSelectionIcon(
        index: index, scrollAmount: _scrollAmount, color: color, 
        onTapDown: (index, color, tapDownDetails) {
          widget.onTapDown(color, tapDownDetails);

          _pageController.animateToPage(
            index, duration: const Duration(milliseconds: 300), curve: Curves.linear
          );
        }
      )
    );
  }



  double _scrollAmount = 0.0;
  final PageController _pageController = new PageController(viewportFraction: 1/3);
}
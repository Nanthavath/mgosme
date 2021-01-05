import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final TrackingScrollController scrollController;

  const Header({this.scrollController});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Color _backgroundColor;
  Color _backgroundColorIcon;
  double _opacity;
  double _offset;

  final _opacityMax = 0.01;

  @override
  void initState() {
    _backgroundColor = Colors.transparent;
    _backgroundColorIcon = Colors.white;
    _opacity = 0.0;
    _offset = 0.0;

    widget.scrollController.addListener(() {
      _onScroll();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ສະບາຍດີ:'),
              InkWell(
                child: Icon(
                  Icons.language,
                  color: _backgroundColorIcon,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    final scrollOffset = widget.scrollController.offset;
    if (scrollOffset >= _offset && scrollOffset > 5) {
      _opacity = double.parse((_opacity + _opacityMax).toStringAsFixed(2));
      if (_opacity >= 1.0) {
        _opacity = 1.0;
      }
    } else if (scrollOffset < 100) {
      _opacity = double.parse((_opacity + _opacityMax).toStringAsFixed(2));
      if (_opacity <= 1.0) {
        _opacity = 0.0;
      }
    }
    setState(() {
      if (scrollOffset <= 0) {
        _backgroundColor = Colors.white;
        _backgroundColorIcon = Colors.white;
        _opacity = 0.0;
        _offset = 0.0;
      } else {
        _backgroundColorIcon = Colors.blue;
      }
      _backgroundColor = Colors.white.withOpacity(_opacity);
    });
  }
}

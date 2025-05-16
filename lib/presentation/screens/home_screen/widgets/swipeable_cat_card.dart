import 'package:pawpartner/data/models/cat_dto.dart';

import 'package:flutter/material.dart';
import 'package:pawpartner/presentation/screens/home_screen/widgets/cat_card.dart';

class SwipeableCatCard extends StatefulWidget {
  final Cat cat;
  final AnimationController animationController;
  final Function(bool) onSwipe;
  final VoidCallback onCardTap;

  const SwipeableCatCard({
    super.key,
    required this.cat,
    required this.animationController,
    required this.onSwipe,
    required this.onCardTap,
  });

  @override
  SwipeableCatCardState createState() => SwipeableCatCardState();
}

class SwipeableCatCardState extends State<SwipeableCatCard> {
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _configureAnimations();
  }

  void _configureAnimations() {
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    final delta = details.delta.dx;
    final screenWidth = MediaQuery.of(context).size.width;
    final normalizedDelta = delta / screenWidth * 2;

    widget.animationController.value =
        (widget.animationController.value + normalizedDelta).clamp(0.0, 1.0);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (widget.animationController.value > 0.5 ||
        details.velocity.pixelsPerSecond.dx.abs() > 500) {
      final isLike = widget.animationController.value > 0.5 ||
          details.velocity.pixelsPerSecond.dx > 0;
      _triggerSwipeAnimation(isLike);
    } else {
      widget.animationController.reverse();
    }
  }

  void _triggerSwipeAnimation(bool isLike) {
    final endOffset = isLike ? Offset(2.0, 0.0) : Offset(-2.0, 0.0);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: endOffset,
    ).animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Curves.easeInOut,
    ));

    widget.onSwipe(isLike);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _handleDragUpdate,
      onPanEnd: _handleDragEnd,
      child: AnimatedBuilder(
        animation: widget.animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: _offsetAnimation.value * MediaQuery.of(context).size.width,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: CatCard(
                    cat: widget.cat,
                    onTap: widget.onCardTap,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
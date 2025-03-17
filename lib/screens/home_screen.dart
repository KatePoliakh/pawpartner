import 'package:flutter/material.dart';
import 'package:pawpartner/models/cat_model.dart';
import 'package:pawpartner/screens/detail_screen.dart';
import 'package:pawpartner/services/cat_api.dart';
import 'package:pawpartner/widgets/cat_card.dart';
import 'package:pawpartner/widgets/like_dislike_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Cat? _currentCat;
  int _likesCount = 0;
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _configureAnimations();
    _fetchCat();
  }

  void _configureAnimations() {
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  Future<void> _fetchCat() async {
    final cat = await CatApi().fetchRandomCat();
    setState(() {
      _currentCat = cat;
    });
    _animationController.reset();
  }

  void _triggerSwipe(bool isLike) {
    if (_currentCat == null) return;

    final endOffset = isLike ? Offset(2.0, 0.0) : Offset(-2.0, 0.0);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: endOffset,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward().then((_) {
      if (isLike) {
        setState(() => _likesCount++);
      }
      _fetchCat();
    });
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    final delta = details.delta.dx;
    final screenWidth = MediaQuery.of(context).size.width;
    final normalizedDelta = delta / screenWidth * 2;

    _animationController.value = (_animationController.value + normalizedDelta)
        .clamp(0.0, 1.0);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_animationController.value > 0.5 ||
        details.velocity.pixelsPerSecond.dx.abs() > 500) {
      final isLike =
          _animationController.value > 0.5 ||
          details.velocity.pixelsPerSecond.dx > 0;
      _triggerSwipe(isLike);
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PawPartner',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.brown[100],
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red),
                const SizedBox(width: 4),
                Text(
                  '$_likesCount',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:
            _currentCat == null
                ? const Center(child: CircularProgressIndicator())
                : Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onPanUpdate: _handleDragUpdate,
                        onPanEnd: _handleDragEnd,
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.translate(
                              offset:
                                  _offsetAnimation.value *
                                  MediaQuery.of(context).size.width,
                              child: Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Opacity(
                                  opacity: _opacityAnimation.value,
                                  child: FractionallySizedBox(
                                    widthFactor: 0.8, // 80% ширины экрана
                                    child: CatCard(
                                      cat: _currentCat!,
                                      onTap:
                                          () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => DetailScreen(
                                                    cat: _currentCat!,
                                                  ),
                                            ),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      color: Colors.brown[100],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LikeDislikeButton(
                            icon: Icons.thumb_down,
                            color: Colors.red,
                            onPressed: () => _triggerSwipe(false),
                          ),
                          LikeDislikeButton(
                            icon: Icons.thumb_up,
                            color: Colors.green,
                            onPressed: () => _triggerSwipe(true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

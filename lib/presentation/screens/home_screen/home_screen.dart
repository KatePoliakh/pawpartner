import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pawpartner/core/services/likes_service.dart';
import 'package:pawpartner/data/api/cat_api.dart';
import 'package:pawpartner/data/models/cat_dto.dart';
import 'package:pawpartner/data/models/liked_cat_dto.dart';
import 'package:pawpartner/di/service_locator.dart';
import 'package:pawpartner/presentation/screens/detail_screen/detail_screen.dart';
import 'package:pawpartner/presentation/screens/home_screen/widgets/action_buttons_panel.dart';
import 'package:pawpartner/presentation/screens/home_screen/widgets/home_screen_app_bar.dart';
import 'package:pawpartner/presentation/screens/home_screen/widgets/swipeable_cat_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Cat? _currentCat;
  late AnimationController _animationController;
  final LikesService _likesService = getIt<LikesService>();
  final CatApi _catApi = CatApi();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fetchCat();
    _likesService.addListener(_updateLikesCount);
  }

  Future<void> _fetchCat() async {
    try {
      final cat = await _catApi.fetchRandomCat();
      if (mounted) {
        setState(() => _currentCat = cat);
      }
      _animationController.reset();
    } on SocketException catch (_) {
      _showNetworkErrorDialog('Нет интернет-соединения');
    } on http.ClientException catch (e) {
      _showNetworkErrorDialog('Ошибка подключения: ${e.message}');
    } on FormatException catch (_) {
      _showNetworkErrorDialog('Ошибка формата данных');
    } catch (e) {
      _showNetworkErrorDialog('Неизвестная ошибка: ${e.toString()}');
    }
  }

  void _showNetworkErrorDialog(String message) {
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Ошибка сети'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  _fetchCat();
                },
                child: const Text('Повторить'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _handleSwipe(bool isLike) {
    if (_currentCat == null) return;

    if (isLike) {
      final likedCat = LikedCat(cat: _currentCat!, likedDate: DateTime.now());
      _likesService.addLikedCat(likedCat);
    }

    _animationController.forward().then((_) {
      if (mounted) _fetchCat();
    });
  }

  void _updateLikesCount() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(likesCount: _likesService.likedCats.length),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child:
                _currentCat == null
                    ? const Center(child: CircularProgressIndicator())
                    : SwipeableCatCard(
                      cat: _currentCat!,
                      animationController: _animationController,
                      onSwipe: _handleSwipe,
                      onCardTap: _navigateToDetailScreen,
                    ),
          ),
          ActionButtonsPanel(
            onLike: () => _handleSwipe(true),
            onDislike: () => _handleSwipe(false),
          ),
        ],
      ),
    );
  }

  void _navigateToDetailScreen() {
    if (_currentCat == null) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(cat: _currentCat!)),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _likesService.removeListener(_updateLikesCount);
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:fruit_hub_market/core/widgets/info_action_row.dart';

class EmptyCartView extends StatefulWidget {
  const EmptyCartView({super.key});

  @override
  State<EmptyCartView> createState() => _EmptyCartViewState();
}

class _EmptyCartViewState extends State<EmptyCartView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _scaleAnim = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoActionRow(text: 'السله'),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _scaleAnim,
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF7EF),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 52,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                 Text(
                  "لا توجد عناصر بعد",
                  style:Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "سلة المشتريات فارغة. ابدأ بإضافة فواكه طازجة واستمتع بتجربة تسوق صحية",
                    textAlign: TextAlign.center,
                    style:Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:fruit_hub_market/core/utils/app_imports.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _headerAnim;
  late Animation<double> _formAnim;
  late Animation<double> _socialAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _headerAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    );

    _formAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
    );

    _socialAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimated({
    required Animation<double> animation,
    required Widget child,
    double offset = 20,
  }) {
    return FadeTransition(
      opacity: animation,
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, offset * (1 - animation.value)),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildAnimated(
                    animation: _headerAnim,
                    child: Column(
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Hero(
                            tag: 'appLogo',
                            child: Image.asset(
                              Assets.images.appLogo.path,
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "أهلاً بيك 👋",
                          style: StyleManager.font19Weight700,
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "سجل دخولك واستمتع بأفضل الكريبات والبيتزا",
                          textAlign: TextAlign.center,
                          style: StyleManager.font13Weight600,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildAnimated(
                    animation: _formAnim,
                    child: const LoginForm(),
                  ),

                  const SizedBox(height: 40),
                  _buildAnimated(
                    animation: _socialAnim,
                    child: DontHaveAccountSection(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
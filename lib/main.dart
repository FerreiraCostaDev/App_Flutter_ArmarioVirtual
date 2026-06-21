import 'package:flutter/material.dart';

// ============================================================
//  TEMA — paleta do Armário Virtual
// ============================================================
const Color kCharcoal  = Color(0xFF1A1A2E);
const Color kDeep      = Color(0xFF16213E);
const Color kAccent    = Color(0xFFE8A87C);
const Color kAccent2   = Color(0xFFC97B4B);
const Color kCream     = Color(0xFFFBF8F3);
const Color kBorder    = Color(0xFFE8E4F0);
const Color kTextMid   = Color(0xFF5C5C7A);
const Color kTextLight = Color(0xFF9B9BB8);
const Color kMint      = Color(0xFFA8D5BA);
const Color kLavender  = Color(0xFFC4B7E8);

ThemeData appTheme() => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: kAccent2,
    primary: kCharcoal,
    secondary: kAccent,
    surface: kCream,
  ),
  scaffoldBackgroundColor: kCream,
  appBarTheme: const AppBarTheme(
    backgroundColor: kCharcoal,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: 'Georgia',
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      letterSpacing: 0.5,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kCharcoal,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 4,
    shadowColor: kCharcoal.withOpacity(0.12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
      side: BorderSide(color: kBorder),
    ),
  ),
  useMaterial3: true,
);

// ============================================================
//  MAIN
// ============================================================
void main() => runApp(const ArmarioVirtualApp());

class ArmarioVirtualApp extends StatelessWidget {
  const ArmarioVirtualApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Armário Virtual',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/',
      routes: {
        '/':       (_) => const SplashScreen(),
        '/menu':   (_) => const MenuScreen(),
        '/login':  (_) => const LoginScreen(),
        '/tela1':  (_) => const Tela1Screen(),
        '/tela2':  (_) => const Tela2Screen(),
        '/tela21': (_) => const Tela21Screen(),
        '/tela3':  (_) => const Tela3Screen(),
      },
    );
  }
}

// ============================================================
//  WIDGETS REUTILIZÁVEIS
// ============================================================

/// Botão primário padrão do app
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? kCharcoal,
          foregroundColor: foregroundColor ?? Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        icon: icon != null ? Icon(icon, size: 18) : const SizedBox.shrink(),
        label: Text(label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
      ),
    );
  }
}

/// Card de seção com título e conteúdo
class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(icon, color: kAccent2, size: 20),
              const SizedBox(width: 8),
              Text(title,
                style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w700,
                  color: kCharcoal)),
              const SizedBox(width: 8),
              Expanded(child: Divider(color: kBorder, thickness: 1)),
            ]),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

/// Badge colorido tipo pill
class PillBadge extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const PillBadge({
    super.key,
    required this.text,
    this.color = kAccent,
    this.textColor = kCharcoal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text,
        style: TextStyle(
          fontSize: 11, fontWeight: FontWeight.w700,
          color: textColor, letterSpacing: 0.5)),
    );
  }
}

/// Imagem ilustrativa com placeholder customizado (sem assets)
class IllustrationBox extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final double size;
  final String? label;

  const IllustrationBox({
    super.key,
    required this.icon,
    this.bgColor = const Color(0xFFEEF2FF),
    this.iconColor = kAccent2,
    this.size = 120,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(size * 0.25),
            border: Border.all(color: kBorder, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: kCharcoal.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Icon(icon, size: size * 0.45, color: iconColor),
        ),
        if (label != null) ...[
          const SizedBox(height: 8),
          Text(label!,
            style: const TextStyle(
              fontSize: 12, color: kTextMid, fontWeight: FontWeight.w500)),
        ],
      ],
    );
  }
}

// ============================================================
//  TELA DE ABERTURA (SPLASH)
// ============================================================
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCharcoal,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Column(
            children: [
              // Logo
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  color: kAccent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.checkroom_rounded,
                  size: 48, color: kCharcoal),
              ),
              const SizedBox(height: 20),

              // Nome do app
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(text: 'Armário',
                      style: TextStyle(
                        fontSize: 36, fontWeight: FontWeight.w800,
                        color: Colors.white, letterSpacing: -0.5)),
                    TextSpan(text: ' Virtual',
                      style: TextStyle(
                        fontSize: 36, fontWeight: FontWeight.w800,
                        color: kAccent, letterSpacing: -0.5)),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Text('App do Cliente',
                style: TextStyle(
                  fontSize: 14, color: Colors.white60,
                  letterSpacing: 2, fontWeight: FontWeight.w300)),

              const SizedBox(height: 36),

              // Imagem ilustrativa 1 — Look Virtual
              IllustrationBox(
                icon: Icons.face_retouching_natural_rounded,
                bgColor: const Color(0xFF243050),
                iconColor: kAccent,
                size: 130,
                label: '',
              ),

              const SizedBox(height: 30),

              // Card de boas-vindas
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PillBadge(
                      text: '✨ PROJETO INTEGRADOR',
                      color: kAccent,
                      textColor: kCharcoal,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Bem-vindo ao Armário Virtual',
                      style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800,
                        color: Colors.white, height: 1.2),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Projeto Integrador do aplicativo Armário Virtual, '
                      'desenvolvido para a disciplina de Engenharia e '
                      'Qualidade de Software.',
                      style: TextStyle(
                        fontSize: 14, color: Colors.white70, height: 1.6),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Este aplicativo será integrado via contêiner, na AWS, '
                      'ao projeto da disciplina de Redes de Computadores.',
                      style: TextStyle(
                        fontSize: 14, color: Colors.white70, height: 1.6),
                    ),
                    const SizedBox(height: 20),
                    // Tags de tecnologia
                    Wrap(
                      spacing: 8, runSpacing: 8,
                      children: [
                        _TechTag(label: '🐳 Docker'),
                        _TechTag(label: '☁️ AWS'),
                        _TechTag(label: '📱 Flutter'),
                        _TechTag(label: '🔗 REST API'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Botão → Menu
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/menu'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccent,
                    foregroundColor: kCharcoal,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  ),
                  icon: const Icon(Icons.arrow_forward_rounded, size: 20),
                  label: const Text('Entrar no Aplicativo',
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800)),
                ),
              ),

              const SizedBox(height: 20),
              Text('Squad 34 · FICR · Porto Digital',
                style: TextStyle(
                  fontSize: 11, color: Colors.white.withOpacity(0.3),
                  letterSpacing: 1)),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechTag extends StatelessWidget {
  final String label;
  const _TechTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(label,
        style: const TextStyle(
          fontSize: 11, color: Colors.white70,
          fontWeight: FontWeight.w600)),
    );
  }
}

// ============================================================
//  MENU PRINCIPAL (com Drawer)
// ============================================================
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static const List<_MenuItem> _items = [
    _MenuItem(route: '/login',  icon: Icons.login_rounded,
      label: 'Login do Cliente', subtitle: 'Acesse sua conta', color: Color(0xFFEEF2FF)),
    _MenuItem(route: '/tela1',  icon: Icons.checkroom_rounded,
      label: 'Meu Look Virtual', subtitle: 'Experimente peças virtualmente', color: Color(0xFFFFF0E8)),
    _MenuItem(route: '/tela2',  icon: Icons.category_rounded,
      label: 'Catálogo de Produtos', subtitle: 'Explore nossa coleção', color: Color(0xFFE8F5EE)),
    _MenuItem(route: '/tela3',  icon: Icons.history_rounded,
      label: 'Histórico de Looks', subtitle: 'Seus looks favoritos', color: Color(0xFFFFF8E1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Armário Virtual'),
        leading: Builder(builder: (ctx) =>
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(ctx).openDrawer(),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: kAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('MENU',
              style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w800,
                color: kAccent, letterSpacing: 1.5)),
          ),
        ],
      ),
      drawer: _AppDrawer(items: _items),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kCharcoal, kDeep],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52, height: 52,
                      decoration: BoxDecoration(
                        color: kAccent,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.checkroom_rounded,
                        color: kCharcoal, size: 28),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Menu Principal',
                            style: TextStyle(
                              color: Colors.white, fontSize: 18,
                              fontWeight: FontWeight.w800)),
                          SizedBox(height: 2),
                          Text('Selecione uma opção abaixo',
                            style: TextStyle(
                              color: Colors.white60, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Imagem ilustrativa 2 — Moda / Catálogo
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IllustrationBox(
                      icon: Icons.style_rounded,
                      bgColor: const Color(0xFFFFF0E8),
                      iconColor: kAccent2,
                      size: 80,
                      label: 'Moda',
                    ),
                    const SizedBox(width: 20),
                    IllustrationBox(
                      icon: Icons.shopping_bag_rounded,
                      bgColor: const Color(0xFFE8F5EE),
                      iconColor: const Color(0xFF2D7D52),
                      size: 80,
                      label: 'Compras',
                    ),
                    const SizedBox(width: 20),
                    IllustrationBox(
                      icon: Icons.qr_code_rounded,
                      bgColor: const Color(0xFFEEF2FF),
                      iconColor: kLavender,
                      size: 80,
                      label: 'QR Look',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text('Navegação',
                style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w700,
                  color: kTextMid, letterSpacing: 1)),
              const SizedBox(height: 12),

              // Cards de navegação
              ..._items.map((item) => _MenuCard(item: item)),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem {
  final String route;
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;

  const _MenuItem({
    required this.route,
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
  });
}

class _MenuCard extends StatelessWidget {
  final _MenuItem item;
  const _MenuCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, item.route),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: kBorder),
            boxShadow: [
              BoxShadow(
                color: kCharcoal.withOpacity(0.06),
                blurRadius: 12, offset: const Offset(0, 2)),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: kAccent2, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.label,
                      style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700,
                        color: kCharcoal)),
                    const SizedBox(height: 2),
                    Text(item.subtitle,
                      style: const TextStyle(
                        fontSize: 12, color: kTextMid)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: kTextLight),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  final List<_MenuItem> items;
  const _AppDrawer({required this.items});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kCharcoal,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 64, height: 64,
                    decoration: BoxDecoration(
                      color: kAccent,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(Icons.checkroom_rounded,
                      color: kCharcoal, size: 34),
                  ),
                  const SizedBox(height: 14),
                  const Text('Armário Virtual',
                    style: TextStyle(
                      color: Colors.white, fontSize: 20,
                      fontWeight: FontWeight.w800)),
                  const Text('App do Cliente',
                    style: TextStyle(color: Colors.white54, fontSize: 12)),
                  const SizedBox(height: 20),
                  Divider(color: Colors.white.withOpacity(0.1)),
                ],
              ),
            ),

            // Items
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('NAVEGAÇÃO',
                  style: TextStyle(
                    fontSize: 10, fontWeight: FontWeight.w700,
                    color: Colors.white38, letterSpacing: 1.5)),
              ),
            ),
            ...items.map((item) => ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 2),
              leading: Container(
                width: 36, height: 36,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(item.icon, color: kAccent, size: 18),
              ),
              title: Text(item.label,
                style: const TextStyle(
                  color: Colors.white, fontSize: 13,
                  fontWeight: FontWeight.w600)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, item.route);
              },
            )),

            const Spacer(),
            Divider(color: Colors.white.withOpacity(0.1)),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              leading: const Icon(Icons.arrow_back_rounded, color: Colors.white54, size: 18),
              title: const Text('Tela de Abertura',
                style: TextStyle(color: Colors.white54, fontSize: 13)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context, '/', (route) => false);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// ============================================================
//  TELA LOGIN (Menu → Tela de Login)
// ============================================================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _senhaCtrl = TextEditingController();
  bool _obscure = true;
  bool _loading = false;

  void _handleLogin() async {
    if (_emailCtrl.text.isEmpty || _senhaCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha e-mail e senha'),
          backgroundColor: kAccent2,
        ),
      );
      return;
    }
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _loading = false);
    Navigator.pushNamed(context, '/menu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login do Cliente')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Ilustração 1 — Login
              IllustrationBox(
                icon: Icons.account_circle_rounded,
                bgColor: const Color(0xFFEEF2FF),
                iconColor: kLavender,
                size: 110,
                label: 'Acesso do Cliente',
              ),

              const SizedBox(height: 28),

              SectionCard(
                title: 'Entre na sua conta',
                icon: Icons.lock_rounded,
                child: Column(
                  children: [
                    // Email
                    TextField(
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        prefixIcon: const Icon(Icons.email_outlined, color: kAccent2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: kBorder),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: kBorder, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: kAccent2, width: 2),
                        ),
                        filled: true, fillColor: kCream,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Senha
                    TextField(
                      controller: _senhaCtrl,
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: const Icon(Icons.lock_outline, color: kAccent2),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscure ? Icons.visibility_off : Icons.visibility,
                            color: kTextLight),
                          onPressed: () => setState(() => _obscure = !_obscure),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: kBorder),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: kBorder, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: kAccent2, width: 2),
                        ),
                        filled: true, fillColor: kCream,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Botão entrar
                    _loading
                      ? const CircularProgressIndicator(color: kAccent2)
                      : PrimaryButton(
                          label: 'Entrar',
                          icon: Icons.arrow_forward_rounded,
                          onPressed: _handleLogin,
                        ),

                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Esqueci a senha',
                        style: TextStyle(color: kTextMid, fontSize: 13)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Voltar ao Menu
              PrimaryButton(
                label: 'Voltar ao Menu',
                icon: Icons.arrow_back_rounded,
                backgroundColor: Colors.white,
                foregroundColor: kCharcoal,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
//  TELA 1 — Meu Look Virtual
// ============================================================
class Tela1Screen extends StatelessWidget {
  const Tela1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Look Virtual')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Badge
              Align(
                alignment: Alignment.centerLeft,
                child: PillBadge(text: '👗 TELA 1'),
              ),
              const SizedBox(height: 12),

              // Imagem ilustrativa — Look Virtual (Imagem 1)
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF4E6FF), Color(0xFFFFD6E0), Color(0xFFFFF0D6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kBorder),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.face_retouching_natural_rounded,
                      size: 64, color: kAccent2),
                    const SizedBox(height: 8),
                    const Text('Experimente Virtualmente',
                      style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700,
                        color: kCharcoal)),
                    const SizedBox(height: 4),
                    Text('Tecnologia de Look Virtual com IA',
                      style: TextStyle(fontSize: 12, color: kTextMid)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              SectionCard(
                title: 'Como funciona',
                icon: Icons.info_outline_rounded,
                child: Column(
                  children: [
                    _StepItem(
                      step: '1',
                      title: 'Tire uma foto',
                      desc: 'Use a câmera do seu dispositivo',
                      icon: Icons.camera_alt_rounded,
                    ),
                    _StepItem(
                      step: '2',
                      title: 'Escolha uma peça',
                      desc: 'Selecione no catálogo da loja',
                      icon: Icons.style_rounded,
                    ),
                    _StepItem(
                      step: '3',
                      title: 'Veja o resultado',
                      desc: 'Look virtual gerado por IA',
                      icon: Icons.auto_awesome_rounded,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              PrimaryButton(
                label: 'Escanear QR Code da Loja',
                icon: Icons.qr_code_scanner_rounded,
                backgroundColor: kAccent,
                foregroundColor: kCharcoal,
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Câmera QR não disponível no Flutter Lab'))),
              ),
              const SizedBox(height: 10),
              PrimaryButton(
                label: 'Voltar ao Menu',
                icon: Icons.arrow_back_rounded,
                backgroundColor: Colors.white,
                foregroundColor: kCharcoal,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  final String step;
  final String title;
  final String desc;
  final IconData icon;

  const _StepItem({
    required this.step,
    required this.title,
    required this.desc,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              color: kCharcoal, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(step,
                style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w800,
                  fontSize: 14)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w700, color: kCharcoal)),
                Text(desc,
                  style: const TextStyle(fontSize: 12, color: kTextMid)),
              ],
            ),
          ),
          Icon(icon, color: kAccent2, size: 20),
        ],
      ),
    );
  }
}

// ============================================================
//  TELA 2 — Catálogo de Produtos
// ============================================================
class Tela2Screen extends StatefulWidget {
  const Tela2Screen({super.key});

  @override
  State<Tela2Screen> createState() => _Tela2ScreenState();
}

class _Tela2ScreenState extends State<Tela2Screen> {
  int _selectedCategory = 0;

  final List<String> _categories = ['Todos', 'Vestidos', 'Blusas', 'Calças'];
  final List<_Product> _products = const [
    _Product(name: 'Vestido Floral', code: 'VF001', category: 'Vestidos',
      price: 'R\$ 189,90', icon: Icons.dry_cleaning_rounded, color: Color(0xFFF4E6FF)),
    _Product(name: 'Blusa Moderna', code: 'BM002', category: 'Blusas',
      price: 'R\$ 89,90', icon: Icons.style_rounded, color: Color(0xFFE8F5EE)),
    _Product(name: 'Calça Social', code: 'CS003', category: 'Calças',
      price: 'R\$ 149,90', icon: Icons.checkroom_rounded, color: Color(0xFFEEF2FF)),
    _Product(name: 'Vestido Midi', code: 'VM004', category: 'Vestidos',
      price: 'R\$ 219,90', icon: Icons.dry_cleaning_rounded, color: Color(0xFFFFF0E8)),
    _Product(name: 'Blusa Listrada', code: 'BL005', category: 'Blusas',
      price: 'R\$ 79,90', icon: Icons.style_rounded, color: Color(0xFFFFF8E1)),
    _Product(name: 'Calça Jeans', code: 'CJ006', category: 'Calças',
      price: 'R\$ 169,90', icon: Icons.checkroom_rounded, color: Color(0xFFE8F5EE)),
  ];

  List<_Product> get _filtered => _selectedCategory == 0
    ? _products
    : _products.where((p) => p.category == _categories[_selectedCategory]).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Produtos')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PillBadge(text: '🏷️ TELA 2'),
                      const Spacer(),
                      // Botão para Tela 2.1
                      ElevatedButton.icon(
                        onPressed: () => Navigator.pushNamed(context, '/tela21'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kAccent,
                          foregroundColor: kCharcoal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                          textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        icon: const Icon(Icons.shopping_cart_rounded, size: 16),
                        label: const Text('Meu Carrinho'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Imagem ilustrativa 2 — Catálogo
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                      color: kCharcoal,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.local_offer_rounded,
                          color: kAccent, size: 28),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nova Coleção',
                                style: TextStyle(
                                  color: Colors.white, fontSize: 14,
                                  fontWeight: FontWeight.w800)),
                              Text('Peças selecionadas para você',
                                style: TextStyle(
                                  color: Colors.white60, fontSize: 11)),
                            ],
                          ),
                        ),
                        PillBadge(
                          text: '${_products.length} peças',
                          color: kAccent,
                          textColor: kCharcoal),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Filtro de categorias
                  SizedBox(
                    height: 36,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (_, i) {
                        final selected = i == _selectedCategory;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedCategory = i),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: selected ? kCharcoal : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: selected ? kCharcoal : kBorder),
                            ),
                            child: Text(_categories[i],
                              style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600,
                                color: selected ? Colors.white : kTextMid)),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),

            // Grid de produtos
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: _filtered.length,
                itemBuilder: (_, i) => _ProductCard(product: _filtered[i]),
              ),
            ),

            // Botão voltar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: PrimaryButton(
                label: 'Voltar ao Menu',
                icon: Icons.arrow_back_rounded,
                backgroundColor: Colors.white,
                foregroundColor: kCharcoal,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Product {
  final String name;
  final String code;
  final String category;
  final String price;
  final IconData icon;
  final Color color;

  const _Product({
    required this.name,
    required this.code,
    required this.category,
    required this.price,
    required this.icon,
    required this.color,
  });
}

class _ProductCard extends StatelessWidget {
  final _Product product;
  const _ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kBorder),
        boxShadow: [
          BoxShadow(
            color: kCharcoal.withOpacity(0.06),
            blurRadius: 12, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem do produto
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Center(
              child: Icon(product.icon, size: 48, color: kAccent2)),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                  style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w700,
                    color: kCharcoal)),
                Text('#${product.code}',
                  style: const TextStyle(fontSize: 11, color: kTextLight)),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.price,
                      style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w800,
                        color: kAccent2)),
                    GestureDetector(
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.name} adicionado!'))),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: kCharcoal,
                          borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.add, color: Colors.white, size: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
//  TELA 2.1 — Carrinho / Detalhe do Pedido
// ============================================================
class Tela21Screen extends StatefulWidget {
  const Tela21Screen({super.key});

  @override
  State<Tela21Screen> createState() => _Tela21ScreenState();
}

class _Tela21ScreenState extends State<Tela21Screen> {
  final List<_CartItem> _items = [
    _CartItem(name: 'Vestido Floral', code: 'VF001', price: 189.90,
      icon: Icons.dry_cleaning_rounded, qty: 1),
    _CartItem(name: 'Blusa Moderna', code: 'BM002', price: 89.90,
      icon: Icons.style_rounded, qty: 2),
  ];

  double get _total => _items.fold(0, (s, i) => s + i.price * i.qty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Carrinho'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: PillBadge(
                text: '${_items.length} itens',
                color: kAccent, textColor: kCharcoal),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: PillBadge(text: '🛒 TELA 2.1'),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Ilustração carrinho
                  Center(
                    child: IllustrationBox(
                      icon: Icons.shopping_bag_rounded,
                      bgColor: const Color(0xFFE8F5EE),
                      iconColor: const Color(0xFF2D7D52),
                      size: 90,
                      label: 'Seus itens selecionados',
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Itens
                  ..._items.map((item) => _CartItemCard(
                    item: item,
                    onIncrease: () => setState(() => item.qty++),
                    onDecrease: () => setState(() {
                      if (item.qty > 1) item.qty--;
                    }),
                    onRemove: () => setState(() => _items.remove(item)),
                  )),

                  const SizedBox(height: 16),

                  // Resumo
                  SectionCard(
                    title: 'Resumo do Pedido',
                    icon: Icons.receipt_long_rounded,
                    child: Column(
                      children: [
                        _SummaryRow(label: 'Subtotal',
                          value: 'R\$ ${_total.toStringAsFixed(2)}'),
                        const _SummaryRow(label: 'Frete', value: 'Grátis'),
                        const Divider(height: 20),
                        _SummaryRow(
                          label: 'Total',
                          value: 'R\$ ${_total.toStringAsFixed(2)}',
                          bold: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  PrimaryButton(
                    label: 'Finalizar Pedido',
                    icon: Icons.check_circle_rounded,
                    backgroundColor: kAccent,
                    foregroundColor: kCharcoal,
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Pedido realizado com sucesso! 🎉'),
                        backgroundColor: Color(0xFF2D7D52))),
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    label: 'Continuar Comprando',
                    icon: Icons.arrow_back_rounded,
                    backgroundColor: Colors.white,
                    foregroundColor: kCharcoal,
                    onPressed: () => Navigator.pop(context),
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

class _CartItem {
  final String name;
  final String code;
  final double price;
  final IconData icon;
  int qty;

  _CartItem({
    required this.name,
    required this.code,
    required this.price,
    required this.icon,
    required this.qty,
  });
}

class _CartItemCard extends StatelessWidget {
  final _CartItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const _CartItemCard({
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 52, height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFFF4E6FF),
                borderRadius: BorderRadius.circular(12)),
              child: Icon(item.icon, color: kAccent2, size: 26),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                    style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w700,
                      color: kCharcoal)),
                  Text('R\$ ${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12, color: kAccent2,
                      fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            // Qty controls
            Row(
              children: [
                _QtyBtn(icon: Icons.remove, onTap: onDecrease),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('${item.qty}',
                    style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w800,
                      color: kCharcoal)),
                ),
                _QtyBtn(icon: Icons.add, onTap: onIncrease),
              ],
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded,
                color: Color(0xFFf87171), size: 20),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}

class _QtyBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28, height: 28,
        decoration: BoxDecoration(
          color: kBorder, borderRadius: BorderRadius.circular(7)),
        child: Icon(icon, size: 14, color: kCharcoal),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
            style: TextStyle(
              fontSize: bold ? 15 : 13,
              fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
              color: bold ? kCharcoal : kTextMid)),
          Text(value,
            style: TextStyle(
              fontSize: bold ? 15 : 13,
              fontWeight: bold ? FontWeight.w800 : FontWeight.w600,
              color: bold ? kAccent2 : kCharcoal)),
        ],
      ),
    );
  }
}

// ============================================================
//  TELA 3 — Histórico de Looks
// ============================================================
class Tela3Screen extends StatelessWidget {
  const Tela3Screen({super.key});

  static const List<_LookItem> _looks = [
    _LookItem(
      name: 'Look Casual Verão',
      date: '18/06/2026',
      pieces: 'Vestido Floral · Sandália Bege',
      icon: Icons.wb_sunny_rounded,
      color: Color(0xFFFFF0E8),
      favorite: true,
    ),
    _LookItem(
      name: 'Look Trabalho',
      date: '15/06/2026',
      pieces: 'Calça Social · Blusa Moderna',
      icon: Icons.business_center_rounded,
      color: Color(0xFFEEF2FF),
      favorite: false,
    ),
    _LookItem(
      name: 'Look Festa',
      date: '10/06/2026',
      pieces: 'Vestido Midi · Scarpin Preto',
      icon: Icons.celebration_rounded,
      color: Color(0xFFF4E6FF),
      favorite: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Looks')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PillBadge(text: '🗂️ TELA 3'),
              const SizedBox(height: 16),

              // Imagem ilustrativa — Histórico
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kCharcoal,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    IllustrationBox(
                      icon: Icons.history_rounded,
                      bgColor: Colors.white.withOpacity(0.1),
                      iconColor: kAccent,
                      size: 70,
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Seus Looks',
                            style: TextStyle(
                              color: Colors.white, fontSize: 18,
                              fontWeight: FontWeight.w800)),
                          SizedBox(height: 4),
                          Text('3 looks salvos',
                            style: TextStyle(
                              color: Colors.white60, fontSize: 13)),
                          SizedBox(height: 8),
                          Text('2 favoritos ⭐',
                            style: TextStyle(
                              color: kAccent, fontSize: 13,
                              fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text('Looks anteriores',
                style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w700,
                  color: kTextMid, letterSpacing: 1)),
              const SizedBox(height: 12),

              ..._looks.map((look) => _LookCard(look: look)),

              const SizedBox(height: 16),

              PrimaryButton(
                label: 'Voltar ao Menu',
                icon: Icons.arrow_back_rounded,
                backgroundColor: Colors.white,
                foregroundColor: kCharcoal,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LookItem {
  final String name;
  final String date;
  final String pieces;
  final IconData icon;
  final Color color;
  final bool favorite;

  const _LookItem({
    required this.name,
    required this.date,
    required this.pieces,
    required this.icon,
    required this.color,
    required this.favorite,
  });
}

class _LookCard extends StatelessWidget {
  final _LookItem look;
  const _LookCard({super.key, required this.look});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 58, height: 58,
              decoration: BoxDecoration(
                color: look.color,
                borderRadius: BorderRadius.circular(14)),
              child: Icon(look.icon, color: kAccent2, size: 28),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(look.name,
                          style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700,
                            color: kCharcoal)),
                      ),
                      if (look.favorite)
                        const Icon(Icons.star_rounded,
                          color: Color(0xFFF59E0B), size: 18),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(look.pieces,
                    style: const TextStyle(
                      fontSize: 12, color: kTextMid)),
                  const SizedBox(height: 4),
                  Text(look.date,
                    style: const TextStyle(
                      fontSize: 11, color: kTextLight)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: kTextLight),
          ],
        ),
      ),
    );
  }
}

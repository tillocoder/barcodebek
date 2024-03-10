import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.maxFinite,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images_png/keremas.png'), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  'salom',
                  style: TextStyle(fontSize: 70),
                ),
                const Text(
                  'Akkountga kirish',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const WTextFild(
                  hintText: 'email@gmail.com',
                  iconPath: 'assets/icons/mail.svg',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                const WTextFild(
                  hintText: 'Password',
                  iconPath: 'assets/icons/key.svg',
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Kirish',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 41,
                        width: 72,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(begin: Alignment(-3, -9), transform: GradientRotation(1), colors: [
                              Color(0xFFC3E6FF),
                              Color(0xFF0F598E),
                              Color(0xFF9745FF),
                            ]),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward_sharp,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'Ro’yhatdan O’tish',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WTextFild extends StatelessWidget {
  final String hintText;
  final String iconPath;
  const WTextFild({
    super.key,
    required this.hintText,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      borderOnForeground: true,
      shadowColor: const Color.fromARGB(255, 125, 160, 126),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              iconPath,
              height: 12,
              width: 14,
            ),
          ),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
      ),
    );
  }
}

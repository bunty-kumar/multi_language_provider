import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:multi_language_provider/change_language_controller.dart';
import 'package:multi_language_provider/utils/app_strings.dart';
import 'package:provider/provider.dart';

enum Language { english, hindi, spanish }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppString.getTitle(context)),
        actions: [
          Consumer<ChangeLanguageController>(
            builder: (BuildContext context, ChangeLanguageController provider,
                Widget? child) {
              return PopupMenuButton(
                  onSelected: (item) {
                    log("language code selected item : $item");
                    if (Language.english.name == item.name) {
                      provider.changeLanguage(const Locale("en"));
                    } else if (Language.spanish.name == item.name) {
                      provider.changeLanguage(const Locale("es"));
                    } else if (Language.hindi.name == item.name) {
                      provider.changeLanguage(const Locale("hi"));
                    }
                  },
                  itemBuilder: (context) => <PopupMenuEntry<Language>>[
                        const PopupMenuItem(
                            value: Language.english, child: Text("English")),
                        const PopupMenuItem(
                            value: Language.hindi, child: Text("Hindi")),
                        const PopupMenuItem(
                            value: Language.spanish, child: Text("Spanish")),
                      ]);
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(AppString.getDescription(context)),
        ],
      ),
    );
  }
}

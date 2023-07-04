// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:notes_app/notes/models/notes_model.dart';
import 'package:notes_app/style/NotesTheme.dart';

class NotePadPage extends StatefulWidget {
  NotePadPage({super.key, required this.model});
  NotesModel model;

  @override
  State<NotePadPage> createState() => _NotePadPageState();
}

class _NotePadPageState extends State<NotePadPage> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    _noteController.text = widget.model.note;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: NotesTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: NotesTheme.backgroundColor,
        foregroundColor: NotesTheme.highlightColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          maxLines: null,
          controller: _noteController,
          style: NotesTheme.appText(
              size: width / 20,
              weight: FontWeight.normal,
              color: NotesTheme.whiteColor),
        ),
      ),
    );
  }
}


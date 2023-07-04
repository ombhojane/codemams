// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:notes_app/notes/models/notes_model.dart';

import '../../style/NotesTheme.dart';

class NoteCard extends StatelessWidget {
  NoteCard({super.key, required this.model});
  NotesModel model;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: NotesTheme.slightBlack,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.title,
            style: NotesTheme.appText(
                size: width / 20,
                weight: FontWeight.bold,
                color: NotesTheme.whiteColor),
          ),
          Row(
            children: [
              Text(model.date,
                  style: NotesTheme.appText(
                      size: width / 26,
                      weight: FontWeight.normal,
                      color: NotesTheme.whiteColor.withOpacity(0.5))),
              const SizedBox(
                width: 5,
              ),
              Text(model.time,
                  style: NotesTheme.appText(
                      size: width / 26,
                      weight: FontWeight.normal,
                      color: NotesTheme.whiteColor.withOpacity(0.5))),
              const SizedBox(
                width: 5,
              ),
              Text(model.description,
                  style: NotesTheme.appText(
                      size: width / 26,
                      weight: FontWeight.normal,
                      color: NotesTheme.whiteColor.withOpacity(0.5))),
            ],
          )
        ],
      ),
    );
  }
}
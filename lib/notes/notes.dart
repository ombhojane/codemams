import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/authentication/service.dart';
import 'package:notes_app/login/login.dart';
import 'package:notes_app/notes/layout/note_pad.dart';
import 'package:notes_app/notes/models/notes_model.dart';
import 'package:notes_app/notes/widgets/note_card.dart';
import 'package:notes_app/style/NotesTheme.dart';
// import 'package:notes_app/authentication/service.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<NotesModel> models = [
    NotesModel(
        date: "9/4/23",
        description: "Hello Word",
        note:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        time: "10:44",
        title: "GDSC Workshop", id: ''),
    NotesModel(
        date: "9/4/23",
        description: "New",
        note:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        time: "10:44",
        title: "Sunday Shopping", id: ''),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: NotesTheme.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "MAMS",
                style: NotesTheme.appText(
                    size: width / 8,
                    weight: FontWeight.bold,
                    color: NotesTheme.highlightColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (await Authentication.signOut(isGoogleSignIn: true)) {
                      // print("Hello");
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Login()));
                    }
                  },
                  child: Container(
                    height: width / 10,
                    width: width / 10,
                    decoration: BoxDecoration(
                        color: NotesTheme.highlightColor,
                        borderRadius: BorderRadius.circular(width / 20)),
                    child: const Icon(Icons.logout),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: width / 19,
            ),
            CupertinoSearchTextField(
              backgroundColor: NotesTheme.slightBlack,
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: NotesTheme.highlightColor,
                size: width / 16,
              ),
            ),
            SizedBox(
              height: width / 19,
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: Colors.grey,
                      margin: const EdgeInsets.only(left: 32),
                    );
                  },
                  itemCount: models.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return NotePadPage(model: models[index]);
                        }));
                      },
                      child: NoteCard(model: models[index]),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}

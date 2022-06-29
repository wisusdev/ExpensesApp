import 'package:exp_app/models/combined_model.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {

    final CombinedModel cModel;

    const CommentBox({Key? key, required this.cModel}) : super(key: key);

    @override
    Widget build(BuildContext context) {

        String text = cModel.comment;

        return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                children: [
                    // const Icon(Icons.sticky_note_2_outlined, size: 35.0,),
                    Expanded(
                        child: TextFormField(
                            initialValue: text,
                            minLines: 2,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            cursorColor: Colors.green,
                            // maxLength: 10,
                            decoration: InputDecoration(
                                // counterText: '',
                                hintText: 'Agregar comentario (opcional)',
                                hintStyle: const TextStyle(fontSize: 14.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                        color: Colors.green
                                    )
                                )
                            ),
                            onChanged: (text){
                                cModel.comment = text;
                            },
                        ),
                    ),
                ],
            ),
        );
    }
}
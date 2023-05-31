// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lol_app/src/core/contansts/base_urls.dart';

import 'package:lol_app/src/models/spell_model.dart';

class SpeelsWidget extends StatefulWidget {
  final List<Spell>? spellList;
  const SpeelsWidget({
    Key? key,
    required this.spellList,
  }) : super(key: key);

  @override
  State<SpeelsWidget> createState() => _SpeelsWidgetState();
}

class _SpeelsWidgetState extends State<SpeelsWidget> {
  var selected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.spellList?.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.5),
                            child: Container(
                              margin: const EdgeInsets.all(2.5),
                              height: 60,
                              width: 60,
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${BaseUrl.spell}${widget.spellList?[index].image}',
                                progressIndicatorBuilder:
                                    (_, url, downloadProgress) =>
                                        LoadingAnimationWidget.fourRotatingDots(
                                  color: Colors.white,
                                  size: 22,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          selected == index
                              ? const Material(
                                  color: Colors.transparent,
                                  shape: BeveledRectangleBorder(
                                    side: BorderSide(
                                      width: 0.5,
                                      color: Color(0xFFD0A75C),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 72,
                                    width: 72,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.spellList?[selected].name ?? '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                widget.spellList?[selected].description ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}

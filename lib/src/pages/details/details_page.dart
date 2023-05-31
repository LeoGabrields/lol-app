import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/src/core/ui/base_state/base_state.dart';
import 'package:lol_app/src/core/ui/extensions/string_extension.dart';
import 'package:lol_app/src/pages/details/details_controller.dart';
import 'package:lol_app/src/pages/details/details_state.dart';
import 'package:lol_app/src/pages/details/widgets/image_widget.dart';
import 'package:lol_app/src/pages/details/widgets/speels_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends BaseState<DetailsPage, DetailsController> {
  var scrollController = ScrollController();
  var scrollOffset = 0.0;

  @override
  void onReady() {
    scrollController.addListener(() {
      setState(() {
        scrollOffset = scrollController.offset;
      });
    });
    super.onReady();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsController, DetailsState>(
      listener: (context, state) {
        switch (state.status) {
          case DetailsStateStatus.initial:
          case DetailsStateStatus.loading:
            showLoader();
          case DetailsStateStatus.loaded:
            hideLoarder();
          case DetailsStateStatus.erro:
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Color(0x891E1F24),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ),
                ),
                expandedHeight: 325,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1.3,
                  titlePadding: EdgeInsetsGeometry.lerp(
                    const EdgeInsets.only(bottom: 10),
                    EdgeInsets.zero,
                    0,
                  ),
                  title: SizedBox(
                    height: 35,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedPadding(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.only(
                            left: scrollOffset > 160 ? 65 : 18,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.championDetails?.name ?? '',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                state.championDetails?.title
                                        .capitalFirstLetter() ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          alignment: Alignment.center,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  background: ImageWidget(
                    id: state.championDetails?.id ?? '',
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 1800,
                    child: Column(
                      children: [
                        Text(
                          state.championDetails?.lore ?? '',
                          style: const TextStyle(
                            color: Color(0xD7FFFFFF),
                          ),
                        ),
                        const SizedBox(height: 40),
                        SpeelsWidget(
                          spellList: state.championDetails?.spells,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

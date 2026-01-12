import 'package:ecommerce_app/core/utils/functions/app_router.dart';
import 'package:ecommerce_app/features/home/presentation/manager/cubit/search_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/cubit/search_state.dart';
import 'package:ecommerce_app/features/home/presentation/views/main_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_card.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_carouse_slider.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_search_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return BlocProvider(
      create: (context) => SearchCubit()..fetchAllProducts(),
      child: Material(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                spacing: 20,
                children: [
                  CustomAppBar(),

                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      return CustomSearchFeild(
                        controller: searchController,
                        onChanged: (value) {
                          context.read<SearchCubit>().onSearchChanged(value);
                        },
                      );
                    },
                  ),

                  CustomCarouselSlider(),

                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is SearchLoaded) {
                        final displayList = state.products;
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: displayList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 9,
                                mainAxisSpacing: 20,
                              ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push(
                                  AppRouter.kItemDetailsView,
                                  extra: displayList[index],
                                );
                              },
                              child: CustomCard(
                                prodectModel: displayList[index],
                              ),
                            );
                          },
                        );
                      } else if (state is SearchError) {
                        return Center(child: Text(state.message));
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

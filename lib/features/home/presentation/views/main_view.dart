import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/utils/functions/app_navigation.dart';
import 'package:ecommerce_app/features/home/presentation/manager/cubit/navigation_cubit_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/cubit/navigation_cubit_state.dart';
import 'package:ecommerce_app/features/home/presentation/views/home_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/orders_status_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/profilr_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/pay_ment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static final List<Widget> screens = [
    const HomeScreen(),
    const OrdersStatusView(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state is NavigationChanged) {
          currentIndex = state.currentIndex;
        }

        return Scaffold(
          body: screens[currentIndex],

          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: AppNavigation.navItems.map((item) {
                final isSelected = item.index == currentIndex;

                return GestureDetector(
                  onTap: () =>
                      context.read<NavigationCubit>().updateIndex(item.index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item.icon,
                        color: isSelected ? kPrimaryColor : Colors.grey,
                        size: 28,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 14,
                          color: isSelected ? kPrimaryColor : Colors.grey,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domain_layer/bloc/shop_cubit/shop_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String routeName = 'main screen';

  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(

          appBar: AppBar(

            title: const Text('Souq'),
            actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search))],
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: cubit.screenNavigation[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            unselectedItemColor: Colors.black38,
            selectedItemColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.red,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottom(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}

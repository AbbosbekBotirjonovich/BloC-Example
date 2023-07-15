import 'package:bloc_tutorial1/bloc/get_cats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<GetCatsBloc, GetCatsState>(
            builder: (context, state) {
              if(state is GetCatsLoading){
                return const CircularProgressIndicator.adaptive();
              }else if (state is GetCatsSuccess) {
                return Image.network(state.data[0].url ?? "");
              }
              else {
                return Image.network(
                    "https://www.thesprucepets.com/thmb/APYdMl_MTqwODmH4dDqaY5q0UoE=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/all-about-tabby-cats-552489-hero-a23a9118af8c477b914a0a1570d4f787.jpg");
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<GetCatsBloc>(context).add(GetCatsPhoto());
        },
        child: const Icon(Icons.sync),
      ),
    );
  }
}

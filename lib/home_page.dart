import 'package:bloc_tutorial1/bloc/get_cats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    )
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<GetCatsBloc, GetCatsState>(
        builder: (context, state) {
          if(state is GetCatsLoading){
            return const CircularProgressIndicator.adaptive();
          }else if (state is GetCatsSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context,index){
                  return Container(
                    padding: const EdgeInsets.all(8),
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(state.data[index].url ?? "",fit: BoxFit.cover,),
                  );
                },
              ),
            );
          }
          else {
            return Image.network(
                "https://www.thesprucepets.com/thmb/APYdMl_MTqwODmH4dDqaY5q0UoE=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/all-about-tabby-cats-552489-hero-a23a9118af8c477b914a0a1570d4f787.jpg");
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<GetCatsBloc>(context).add(GetCatsPhoto(number: _controller.text));
        },
        child: const Icon(Icons.sync),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pic_app/cubit/pics_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pics App'),
      ),
      body: BlocProvider(
        create: (context) => PicsCubit()..getAllPics(),
        child: BlocBuilder<PicsCubit, PicsState>(builder: (context, state) {
          if (state.status == PicsStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            var pics = state.pics;
            return GridView.builder(
              itemCount: pics.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 4.0),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      elevation: 12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(pics[index].url),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      pics[index].photographer,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                );
              },
            );
          }
        }),
      ),
    );
  }
}

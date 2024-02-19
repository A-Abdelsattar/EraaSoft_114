import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_114/features/home/view_model/home_cubit/home_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeCubit()
        ..getPopular(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movie"),
          centerTitle: true,
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit=HomeCubit.get(context);
            return Column(
              children: [
                SizedBox(
                  height: 350,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)=> Container(
                    width: 200,
                    height: 350,
                    decoration: BoxDecoration(
                        border: Border.all(width: .5)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Image.network("https://image.tmdb.org/t/p/w500${cubit.popularModel?.results?[index].posterPath}",)),
                        Row(
                          children: [
                            Text(cubit.popularModel?.results?[index].title??''),
                            Icon(Icons.star, color: Colors.yellow,),
                            Text(cubit.popularModel?.results?[index].voteAverage.toString()??'')
                          ],
                        ),
                        Text(cubit.popularModel?.results?[index].overview??'',maxLines: 3,overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  )
                      , separatorBuilder: (context,index)=>SizedBox(width: 5,), itemCount: 5),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

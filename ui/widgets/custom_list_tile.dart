import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/data/models/character.dart';
import 'package:rick_and_morty_api/ui/widgets/character_status.dart';

class CustomListTile extends StatelessWidget {
  final Results result;

  const CustomListTile({super.key, required this.result});


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        //color: Color.fromRGBO(86, 86, 86, 0),
        color: Color.fromRGBO(86, 86, 86, 0.8),
        //color: Colors.red,
        child: Row(children: [
          CachedNetworkImage(
            imageUrl: result.image,
            placeholder: (context, url) => Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: const CircularProgressIndicator(
                color: Colors.grey,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.9,
                child: Text(
                  result.name,
                  overflow: TextOverflow.ellipsis,
                  // style: Theme.of(context).textTheme.bodyMedium,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              CharacterStatus(
                liveState: result.status == 'Alive'
                    ? LiveState.alive
                    : result.status == 'Dead'
                        ? LiveState.dead
                        : LiveState.unknown,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Species:",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                result.species,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gender:",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 5),
                              Text(
                                result.gender,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
//     return ListTile(
//               title: Text(
//             result.name,
//             style: TextStyle(color: Colors.white),),);
//   }}
//
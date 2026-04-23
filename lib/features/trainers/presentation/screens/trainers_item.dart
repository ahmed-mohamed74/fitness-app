import 'package:fitness_app/core/themes/app_images.dart';
import 'package:fitness_app/features/trainers/data/models/trainers_model.dart';
import 'package:flutter/material.dart';

class TrainersItem extends StatelessWidget {
  const TrainersItem({super.key, required this.trainersModel});
  final TrainersModel trainersModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xff1E293B),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Colors.white10),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  trainersModel.image,
                  fit: BoxFit.fill,
                  width: 96,
                  height: 96,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trainersModel.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      trainersModel.specialty,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0D7FF2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Row(
                        children: [
                          Image.asset(Assets.imagesYrsExp),
                          Padding(
                            padding: const EdgeInsets.only(left: 3, right: 16),
                            child: Text(
                              "${trainersModel.expYears} yrs exp",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff94A3B8),
                              ),
                            ),
                          ),
                          Image.asset(Assets.imagesClients),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              "120+ clients",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff94A3B8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff334155),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "View Profile",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded, size: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff334155),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Image.asset(Assets.imagesStar),
                  Text(
                    trainersModel.rating.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff0D7FF2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

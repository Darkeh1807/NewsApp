import 'package:flutter/material.dart';
import 'package:new_app/constants/colors.dart';

class CategoryCard extends StatelessWidget {
  final String categoryTitle;
  final String catIcon;
  const CategoryCard({
    super.key,
    required this.categoryTitle,
    required this.catIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.categoryShadowColor,
      child: SizedBox(
        height: 70,
        width: 340,
        child: Center(
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(255),
                child: Image.asset(
                  catIcon,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                categoryTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

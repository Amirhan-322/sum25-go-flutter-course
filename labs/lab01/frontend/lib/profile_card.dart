import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final int age;
  final String? avatarUrl;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.age,
    this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Implement profile card UI
    return Center(
      child: Container(
        height: 160,
        width: 200,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 225, 199, 0),
              Color.fromARGB(255, 221, 0, 213),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          border: Border.all(
            color: Color.fromARGB(255, 39, 39, 39)
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  
                  Container(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300], // Фон, если нет изображения
                      child: avatarUrl != null 
                        ? ClipOval(
                            child: Image.network(
                              avatarUrl!,
                              fit: BoxFit.cover, // Заполнение с обрезкой
                              width: 50, // Совпадает с размером Container
                              height: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return Text(
                                  name.isNotEmpty ? name[0] : '?',
                                  style: TextStyle(fontSize: 20),
                                );
                              },
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return CircularProgressIndicator(
                                  strokeWidth: 2,
                                  value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                    : null,
                                );
                              },
                            ),
                          )
                        : Text(
                            name.isNotEmpty ? name[0] : '?',
                            style: TextStyle(fontSize: 20),
                          ),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Column(
                    children: [
                      Text(name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                      Text("Age: $age",
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.white
                        ),
                      )
                    ],
                  )
                  
                ],
              ),
              const SizedBox(height: 10,),
              Column(
                children: [
                  const Text("Email:",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  Text(email,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

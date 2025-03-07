import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

   // final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _ImageBubble( message.imageUrl ?? 'https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg'  ),
        const SizedBox(height: 10),
      ],
    );
  }
}


class _ImageBubble extends StatelessWidget {

  final String imageUrl;

   const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {

  
    final size = MediaQuery.of(context).size;
    

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      // child: Image.asset('assets/images/reptil.png', 
      //child: Image.network('https://st2.depositphotos.com/4220060/9975/i/950/depositphotos_99755840-stock-photo-women-in-sexy-corsets.jpg', 
      child: Image.network(imageUrl, 
      width: size.width * 0.5,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        // return Container(
        //       width: size.width * 0.7,
        //       height: 150,
        //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //       child: const Text('Mi amor está enviando una imagen'),
        //     );

        return const Center(
         child: CircularProgressIndicator(),
        );
      },
      ),
      );
  }
}
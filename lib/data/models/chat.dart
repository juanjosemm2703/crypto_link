class Chat {
  final String name, lastMessage, image;
  final bool isActive;

  Chat(
      {required this.name,
      required this.lastMessage,
      required this.image,
      required this.isActive});
}

List<Chat> chatsData = [
  Chat(
      name: 'Juan Jose Martinez',
      lastMessage: 'Hola, como estas?',
      image:
          'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/164145062/original/dc5c7a2b6d9e6a91a56da9978e602caa4c64de60/cool-and-cute-profile-pictures.png',
      isActive: true),
  Chat(
      name: 'Aldemar Fonseca',
      lastMessage: 'Que haces?',
      image:
          'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_0.jpg',
      isActive: true),
  Chat(
      name: 'Diana Vera',
      lastMessage: 'Espero que todo vaya bien',
      image:
          'https://image.shutterstock.com/image-vector/female-silhoutte-avatar-default-profile-260nw-1219366543.jpg',
      isActive: false),
];

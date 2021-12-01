class OnlinePeople {
  final int id;
  final String name, image;
  final bool isActive;

  OnlinePeople(
      {required this.id,
      required this.name,
      required this.isActive,
      required this.image});
}

List<OnlinePeople> onlinePeopleData = [
  OnlinePeople(
    id: 0,
    name: 'Camilo Diaz',
    isActive: true,
    image:
        'https://thumbs.dreamstime.com/b/handsome-man-smiling-cheerful-big-smile-face-showing-teeth-positive-happy-expression-handsome-man-smiling-cheerful-212902822.jpg',
  ),
  OnlinePeople(
    id: 1,
    name: 'Juan Martinez',
    isActive: true,
    image:
        'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/164145062/original/dc5c7a2b6d9e6a91a56da9978e602caa4c64de60/cool-and-cute-profile-pictures.png',
  ),
  OnlinePeople(
    id: 2,
    name: 'Aldemar Fonseca',
    isActive: true,
    image:
        'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_0.jpg',
  ),
  OnlinePeople(
    id: 3,
    name: 'Diana Vera',
    isActive: false,
    image:
        'https://image.shutterstock.com/image-vector/female-silhoutte-avatar-default-profile-260nw-1219366543.jpg',
  ),
];

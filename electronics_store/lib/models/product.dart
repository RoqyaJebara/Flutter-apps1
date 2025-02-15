class Product {
  final int id, price;
  final String title, subTitle, description, image;
  // final String? image;
  Product(
      {required this.id,
      required this.price,
      required this.title,
      required this.subTitle,
      required this.description,
      required this.image});
}

List<Product> products = [
  Product(
      id: 1,
      price: 59,
      title: "Wireless headphones",
      subTitle: "High sound quality",
      description:
          "Lorem Ipsum dollar set amet, constructor adiba escuing allite, set du iosmud tempor encaedidonteut labor at dollar magna aliquia.",
      image: "images/airpod.png"),
  Product(
      id: 2,
      price: 1099,
      title: "Mobile device",
      subTitle: "The mobile phone has become powerful",
      description:
          "Lorem Ipsum dollar set amet, constructor adiba escuing allite, set du iosmud tempor encaedidonteut labor at dollar magna aliquia.",
      image: "images/mobile.png"),
  Product(
      id: 3,
      price: 39,
      title: "3D glasses",
      description:
          "Lorem Ipsum dollar set amet, constructor adiba escuing allite, set du iosmud tempor encaedidonteut labor at dollar magna aliquia.",
      subTitle: "To take you to the virtual world",
      image: "images/class.png"),
  Product(
      id: 4,
      price: 56,
      title: "headphones",
      description:
          "Lorem Ipsum dollar set amet, constructor adiba escuing allite, set du iosmud tempor encaedidonteut labor at dollar magna aliquia.",
      subTitle: "For long listening hours",
      image: "images/headset.png"),
  Product(
      id: 5,
      price: 68,
      title: "Voice Recorder",
      description:
          "Lorem Ipsum dollar set amet, constructor adiba escuing allite, set du iosmud tempor encaedidonteut labor at dollar magna aliquia.",
      subTitle: "Record important moments around you",
      image: "images/speaker.png"),
  Product(
      id: 6,
      price: 39,
      title: "Computer cameras",
      description:
          "Lorem Ipsum dollar set amet, constructor adiba escuing allite, set du iosmud tempor encaedidonteut labor at dollar magna aliquia.",
      subTitle: "High image quality and resolution",
      image: "images/camera.png"),
];

import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  // food menu
  final List<Food> _foodMenu = [
    // Salmon sushi
    Food(
      name: "Inari Sushi",
      description:
          "Inari Sushi is a delightful Japanese dish featuring sweet and savory flavors. It consists of Sushi rice wrapped in a pouch of deep-fried tofu skin, called 'abura-age', which is simmered in a mixture of soy sauce, sugar, and mirin. The tofu pouch absorbs the seasoning, giving the Sushi a rich, slightly sweet taste. Unlike traditional Sushi, Inari sushi is typically vegetarian, making it popular among plant-based eaters. Its soft, juicy exterior contrasts with the mildly sticky rice inside, creating a satisfying bite. Often served in a rectangular or boat shape, it’s a simple yet flavorful treat.",
      price: "4000",
      imagePath: "lib/images/inari-maki.png",
      rating: "7.0",
    ),

    // Salmon sushi
    Food(
      name: "Salmon Sushi",
      description:
          'Salmon sushi is a delightful culinary creation that blends simplicity with elegance. Featuring fresh, buttery slices of salmon atop perfectly seasoned rice, it embodies the harmony of texture and flavor. Rich in omega-3 fatty acids, it’s not only a treat for the palate but also a boost for your health. Rooted in Japanese tradition, each piece carries the essence of meticulous craftsmanship and cultural heritage. Whether enjoyed as nigiri, sashimi, or rolls, salmon sushi offers a uniquely satisfying experience.',
      price: "1500",
      imagePath: "lib/images/sushi.png",
      rating: "4.5",
    ),

    // Tuna sushi
    Food(
      name: "Tuna Sushi",
      description:
          "Tuna sushi is a refined delicacy that showcases the bold, rich flavors of the ocean. Its tender, ruby-red slices rest elegantly on seasoned rice, offering a perfect balance of taste and texture. Revered for its high protein content and nutritional value, tuna sushi nourishes both body and soul. Each piece is a tribute to Japanese culinary artistry, celebrating tradition with every bite. Whether served as nigiri, sashimi, or in rolls, tuna sushi delivers a uniquely unforgettable dining experience.",
      price: "1200",
      imagePath: "lib/images/tuna sushi.png",
      rating: "4.9",
    ),

    // Rice Sushi
    Food(
      name: "Rice Sushi",
      description:
          "Rice sushi is the heart of Japanese culinary tradition, transforming humble grains into a masterpiece of flavor and texture. Perfectly seasoned with vinegar, sugar, and salt, each grain is a delicate balance of tangy and sweet. This foundation complements a variety of toppings, from fresh fish to vibrant vegetables, showcasing endless creativity. Celebrated for its simplicity and versatility, rice sushi embodies the spirit of mindfulness in every bite. It’s a canvas for culinary artistry, connecting tradition and innovation in a uniquely meaningful way.",
      price: "1500",
      imagePath: "lib/images/Rice_Shushi.png",
      rating: "4.8",
    ),

    // Sushi Roll
    Food(
      name: "Sushi Roll",
      description:
          "Sushi rolls are a harmonious fusion of flavors and textures, wrapped in tradition and innovation. Encased in delicate nori, they combine seasoned rice, fresh seafood, crisp vegetables, and bold sauces into artful bites. Each roll is a journey, blending the simplicity of Japanese craftsmanship with the creativity of global influences. From classic maki to elaborate specialty rolls, they offer a variety that delights every palate. Sushi rolls are more than food—they are a celebration of culture, connection, and culinary imagination.",
      price: "2200",
      imagePath: "lib/images/sushi-roll.png",
      rating: "4.2",
    ),

    // Many Sushis
    Food(
      name: "Different Sushi's",
      description:
          "Different sushi varieties offer a vibrant exploration of taste, tradition, and craftsmanship. From the simplicity of nigiri to the creativity of specialty rolls, each type showcases a unique blend of fresh ingredients and meticulous technique. Whether it's the delicate balance of flavors in sashimi or the bold combinations in fusion rolls, every piece tells a story of culinary artistry. Rooted in Japanese heritage, these diverse sushi forms bring together the freshest seafood, rice, and vegetables in perfect harmony. Together, they create an unforgettable journey that celebrates both tradition and innovation.",
      price: "4000",
      imagePath: "lib/images/sushi (2).png",
      rating: "4.1",
    ),

    // Nigiri Sushi
    Food(
      name: "Nigiri Sushi",
      description:
          "Nigiri sushi is a timeless expression of Japanese culinary elegance, where simplicity meets sophistication. A perfect mound of vinegared rice is topped with a delicate slice of fresh seafood or other ingredients, offering a balanced, pure taste. The minimalist approach highlights the natural flavors of the fish, allowing its texture and quality to shine. Traditionally served with a hint of wasabi, nigiri embodies the artistry of Japanese craftsmanship in each bite. It's more than just sushi—it's an intimate connection to centuries of culinary tradition and respect for the ingredients.",
      price: "2000",
      imagePath: "lib/images/sushi (1).png",
      rating: "4.0",
    ),

    // Gunkan Sushi
    Food(
      name: "Gunkan Sushi",
      description:
          "Gunkan sushi, often referred to as 'battleship sushi,' is a visually striking and innovative creation. It features a base of vinegared rice wrapped in a nori seaweed shell, topped with delicacies like fish roe, sea urchin, or chopped seafood. The nori acts as a vessel, containing the ingredients in a secure, bite-sized form. Each bite offers a burst of flavors and textures, from the soft rice to the rich and briny toppings. Gunkan sushi represents both the creativity and precision of Japanese cuisine, making it a unique and meaningful part of the sushi experience.",
      price: "2500",
      imagePath: "lib/images/gunkan.png",
      rating: "5.0",
    ),

    // Toro Sushi
    Food(
      name: "Toro Sushi",
      description:
          "Toro sushi is a luxurious delicacy, showcasing the buttery, melt-in-your-mouth texture of fatty tuna. Sourced from the belly of the tuna fish, toro offers a rich, exquisite flavor that sets it apart as a prized sushi cut. The marbled fat enhances its smoothness, creating a refined, indulgent experience with every bite. Often considered the pinnacle of sushi, toro is a celebration of freshness, quality, and tradition. Each piece is a reminder of the deep connection between craftsmanship and the finest ingredients, making it a truly meaningful culinary delight.",
      price: "3000",
      imagePath: "lib/images/toro sushi.png",
      rating: "6.2",
    ),

    // Hosomaki Sushi
    Food(
      name: "Hosomaki Sushi",
      description:
          "Hosomaki sushi is a delicate, flavorful bite that exemplifies the elegance of simplicity in Japanese cuisine. This thin, cylindrical roll features seasoned rice and a single filling, typically fish, cucumber, or avocado, all wrapped in a sheet of nori. Its compact size and minimalist approach highlight the quality of its ingredients, offering a clean, fresh taste in every bite. Hosomaki embodies the balance between restraint and creativity, making it a quintessential sushi experience. Each roll is a testament to the art of precision and the beauty of understated flavors.",
      price: "3200",
      imagePath: "lib/images/hosomaki.png",
      rating: "6.5",
    ),

    // Soja Drink
    Food(
      name: "Soja",
      description:
          'Soy sauce, or "shoyu," is a fundamental element of Japanese cuisine, enhancing the natural flavors of food with its savory, umami-rich depth. Made from fermented soybeans, wheat, and salt, it embodies centuries of craftsmanship and tradition. Whether used as a dipping sauce or a seasoning, soy sauce brings balance and complexity to dishes, elevating them to new heights. Its deep, dark color and rich taste complement a variety of foods, from sushi to grilled meats. Soy sauce is not just a condiment—it is a meaningful connection to the art of Japanese flavor.',
      price: "1200",
      imagePath: "lib/images/soja drink.png",
      rating: "6.0",
    ),
  ];

  // customer cart
  final List<Food> _cart = [];

  // getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addtocart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}

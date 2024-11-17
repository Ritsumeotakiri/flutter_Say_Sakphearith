// profile_data.dart

import 'package:flutter/material.dart';
import 'package:pratice/W5_S2/EXERCISE-1/EXERCISE-2/model/profile_tile_model.dart';

List<ProfileData> profiles = [
  ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    imagePath: 'assets/anng.jpg',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    ],
  ),
  ProfileData(
    name: "Zelda",
    position: "princess",
    imagePath: 'assets/zelda.png',
    tiles: [
      TileData(icon: Icons.phone, title: "Phone Number", value: "09090099"),
      TileData(icon: Icons.location_on, title: "Address", value: "123 Hyrule"),
      TileData(
          icon: Icons.email,
          title: "Mail",
          value: "zelda.cadt@student.cadt.edu.kh"),
    ],
  ),
];
